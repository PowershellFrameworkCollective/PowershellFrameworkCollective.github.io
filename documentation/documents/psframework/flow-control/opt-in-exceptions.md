---
title: flow-control: Opt-In Exceptions
---
# Opt-In Exceptions
## Synopsis

Red error messages have a tendency to scare off users.
However in order to automatically process failure, being able to try/catch errors is critical.

The Opt-In Exception system allows combining the best of both worlds:

+ Friendly warnings when things break for user experience
+ Terminal errors when trying to try/catch in code

## Description

### Basic Workflow

The following commands can be used to implement the Opt-In Exception system:

+ Stop-PSFFunction
+ [Invoke-PSFProtectedCommand](invoke-psfprotectedcommand.html)
+ Invoke-PSFCallback

Basically, these are designed to handle errors for you.
From a workflow perspective, your own commands should have a parameter called `-EnableException`.
Internally, your command performs its business logic, and when things fail, rather than using `throw`, `Write-Error` or a similar command, you call `Stop-PSFFunction`, passing through the value of your own `-EnableException` parameter. Example:

```powershell
function Remove-File {
    [CmdletBinding()]
    param (
        [string]
        $Path,

        [switch]
        $EnableException
    )

    try { Remove-Item -Path $Path -ErrorAction Stop }
    catch {
        Stop-PSFFunction -Message "Failed to delete $Path" -ErrorRecord $_ -EnableException $EnableException
        return
    }
    Write-PSFMessage "$Path deleted" -Level Host
}
```

In this example, if the function fails to delete the targeted item, it will write a warning (which thanks to the `-ErrorRecord` parameter will include the exception message) and silently end the function.
Unless the user of `Remove-File` used the `-EnableException` parameter, in which case the command will end in a terminating exception.

Both `Invoke-PSFProtectedCommand` and `Invoke-PSFCallback` have their own place in this system but with an a lot more specialized use-case.
For the purpose of this documentation, they behave the same way: Set their `-EnableException` parameter to `$true` and they will terminate with maximum prejudice, don't and they write warnings.

### Interrupting peacefully

With this setup (see previous chapter), we now have a situation where a user of `Remove-File` will _by default_ only see a warning, but can enable errors that can be caught.

This brings a few issues along, however, as we now need to interrupt our command silently.
PowerShell is not designed to error out silently.

The least problematic solution to this is the `return` statement. However, it _does_ have its issues:

```powershell
function Test-Pipeline {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true)]
        $InputObject,
        [switch]$Fail,
        [switch]$EnableException
    )
    begin {
        if ($Fail) {
            Stop-PSFFunction -Message "Failing as ordered" -EnableException $EnableException
            return
        }
    }
    process {
        $InputObject
    }
}
1..3 | Test-Pipeline -Fail -EnableException
1..3 | Test-Pipeline -Fail
```

As running the example will show, while the terminating exception of `-EnableException` will instantly interrupt, the second execution without it will write the warning ... but still execute the process block.

What happens here:
`return` only ends the current block within the function.
Calling `return` during begin ends that block, but PowerShell will now continue with the next line.

This proved to be a troublesome problem, but was solved by introducing a new command called `Test-PSFFunctionInterrupt`.
On error, `Stop-PSFFunction` will flag the calling command as "to terminate".
This is picked up by `Test-PSFFunctionInterrupt` which then needs to be called in subsequent calls:

```powershell
function Test-Pipeline {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true)]
        $InputObject,
        [switch]$Fail,
        [switch]$EnableException
    )
    begin {
        if ($Fail) {
            Stop-PSFFunction -Message "Failing as ordered" -EnableException $EnableException
            return
        }
    }
    process {
        if (Test-PSFFunctionInterrupt) { return }
        $InputObject
    }
}
1..3 | Test-Pipeline -Fail -EnableException
1..3 | Test-Pipeline -Fail
```

This way, it will detect at the beginning of the process block that the command is flagged for termination and will instantly call `return`, ending the process block.

### Handling non-terminating issues

The previous examples showed how to handle the equivalent to _terminating_ exceptions.
However, how about non-terminating exceptions?
When actually, we don't want to flag our entire command for termination and instead just write our warning and move on to the next object, unless the caller demanded a terminating exception (again using `-EnableException` on your command).

This is where the `-Continue` parameter comes in!

```powershell
function Remove-File {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('FullName')]
        [string[]]
        $Path,

        [switch]
        $EnableException
    )

    process {
        foreach ($pathItem in $Path) {
            try { Remove-Item -Path $pathItem -ErrorAction Stop }
            catch {
                Stop-PSFFunction -Message "Failed to delete $pathItem" -Continue -ErrorRecord $_ -EnableException $EnableException
            }
            Write-PSFMessage "$pathItem deleted" -Level Host
        }
    }
}
```

When you use the `-Continue` switch parameter, your command is _not_ flagged for termination.
Instead it calls the `continue` statement, continuing on with the next item in the foreach loop.

Using `-EnableException` will still have the entire `Remove-File` command terminate with an exception that can be caught.

> Note on labels: In case your loops use labels (See: Get-Help about_Break for details on labels), all flow-control commands that support the -Continue parameter also support the -ContinueLabel parameter, allowing you to target a specific loop with the continue call.

### Feature: Inheriting $EnableException

As the previous chapters show, this system is designed for all your commands having an `-EnableException` parameter and passing it through to the relevant `PSFramework` flow-control command.

This leads to a uniform user experience and no walls of red by default.

But wouldn't it be nice if the `PSFramework` commands automatically picked up on whether your command's `-EnableException` parameter was set, removing to need to endlessly pass through `-EnableException $EnableException` on every single call?
Well, where there is a will, there is a script!

Or rather a one-liner:

```powershell
Set-PSFFeature -Name PSFramework.InheritEnableException -Value $true -ModuleName MyModule
```

Note: This only works for modules, not for scripts or other code outside of a module.
Execute this line once during module import (inserting your own module's name) and each time you call `Stop-PSFFunction` it will automatically pick up the value of your `-EnableException` parameters.
Unless you explicitly bind it after all.

Using the previous example, if your module opts into this feature, the code would instead look like this:

```powershell
function Remove-File {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('FullName')]
        [string[]]
        $Path,

        [switch]
        $EnableException
    )

    process {
        foreach ($pathItem in $Path) {
            try { Remove-Item -Path $pathItem -ErrorAction Stop }
            catch {
                Stop-PSFFunction -Message "Failed to delete $pathItem" -Continue -ErrorRecord $_
            }
            Write-PSFMessage "$pathItem deleted" -Level Host
        }
    }
}
```

## Notes

[Back to Flow-Control](https://psframework.org/documentation/documents/psframework/flow-control.html)

| Version | 1.0 |
| Written on: | 2019-11-06 |
| Updated on: | 2019-11-06 |