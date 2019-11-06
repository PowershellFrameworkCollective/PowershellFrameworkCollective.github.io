---
title: flow-control: Invoke-PSFProtectedCommand
---
# Invoke-PSFProtectedCommand
## Synopsis

Explains how the Invoke-PSFProtectedCommand command can empower your code, while driving readability and reducing overhead.

## Description

### The Problem

There are many factors that are used to measure the maturity and quality of code.
Error handling, supporting `-WhatIf` and `-Confirm` as well as message handling are all part of that.
However, faithfully implementing all of that can get tedious fast.

An example of what that might look like:

```powershell
if ($PSCmdlet.ShouldProcess($Path, "Delete")) {
    try {
        Write-PSFMessage -Message "Deleting $Path" -Target $Path
        Remove-Item -Path $Path -Recurse -Force -Confirm:$false -ErrorAction Stop
        Write-PSFMessage -Message "Successfully deleted $Path" -Target $Path
    }
    catch {
        Write-PSFMessage -Level Warning -Message "Failed to delete $Path" -Target $Path -ErrorRecord $_
        Write-Error $_
        continue
    }
}
```

### The Solution

This is exactly where `Invoke-PSFProtectedCommand` comes in:

```powershell
Invoke-PSFProtectedCommand -Action Delete -Target $Path -ScriptBlock {
    Remove-Item -Path $Path -Recurse -Force -Confirm:$false -ErrorAction Stop
} -EnableException $EnableException -Continue
```

This performs all the steps that were taken in the previous example:

+ Implements and respects `-WhatIf` and `-Confirm`
+ Implements error handling and reaction (more on that below)
+ Implements all message handling

### Error Handling peculiarities

This command implements the same [opt-in exception system](opt-in-exceptions.html) as `Stop-PSFFunction` and `Write-PSFMessage` implement.
This means, by default it will not throw an exception on failure.
Instead it will flag the calling command as failed if an error happens in the scriptblock provided for it.

Use the `-EnableException` parameter to enable terminating exceptions.

More details on the [opt-in exception system](opt-in-exceptions.html) can be found on its [dedicated page](opt-in-exceptions.html)

### The -Continue Parameter

If in case of error you do not want to kill the entire function but continue working on the next item - for example within a foreach loop, processing many paths - it is recommended to use the `-Continue` parameter.

Using that parameter will cause the `Invoke-PSFProtectedCommand` cmdlet to call `continue` when a scriptblock fails.
This also supports the use of labels, by using the `-ContinueLabel` parameter.
For more information on using labels to control loops, check `Get-Help about_Break`.

### Trying again

In some cases, it may be beneficial to try again on an error. For example in commands that are timing sensitive or remoting calls in regions with unstable connectivity.

So ... it would be beneficial to give a command a second chance, right?

That is where the three retry-specific parameters come in:

+ `-RetryCount`
+ `-RetryWait`
+ `-RetryErrorType`

In its basic form, this might look like this:

```powershell
Invoke-PSFProtectedCommand -Action Delete -Target $Path -ScriptBlock {
    Remove-Item -Path $Path -Recurse -Force -Confirm:$false -ErrorAction Stop
} -EnableException $EnableException -Continue -RetryCount 3
```

In this case, the command will now attempt four times - once plus three retries - to delete the file in the specified path.
It will wait for five seconds inbetween attempts (five seconds is the default waiting time).

If a different time is desired, use `-RetryWait`, which is a [Timespan Parameter Class](../parameter-classes/timespan-parameter.html). For example, this will cut the waiting time down to two seconds:

```powershell
Invoke-PSFProtectedCommand -Action Delete -Target $Path -ScriptBlock {
    Remove-Item -Path $Path -Recurse -Force -Confirm:$false -ErrorAction Stop
} -EnableException $EnableException -Continue -RetryCount 3 -RetryWait 2s
```

Finally, it may be beneficial to not attempt again on _all_ errors.
Often enough we can closely determine, when another attempt is worthwhile.
For example, in a scenario where we wait for a file to be created before deleting it again, trying again when the file was not found would be useful.
Trying again when access was denied however would be less so.

Using the `-RetryErrorType` parameter, it is possible to specify on exactly which exception types to keep trying:

```powershell
Invoke-PSFProtectedCommand -Action Delete -Target $Path -ScriptBlock {
    Remove-Item -Path $Path -Recurse -Force -Confirm:$false -ErrorAction Stop
} -EnableException $EnableException -Continue -RetryCount 3 -RetryErrorType 'System.Management.Automation.ItemNotFoundException'
```

This will try again if the file could not be found, but not on any other error.

### Localization

The command also supports the `PSFramework` localization feature (full online documentation pending). This means that using the `-ActionString` and `-ActionStringValues` parameters the messages written can be localized.

> Due to a limitation in the message system, message language is currently snapshotted to the display language at the time the message is written. This might be inconvenient if logging in a different language.

For more details on the localization feature, see:

```powershell
Get-Help Import-PSFLocalizedString -Detailed
```

## Notes

[Back to Flow-Control](https://psframework.org/documentation/documents/PSFramework/flow-control.html)

| Version | 1.0 |
| Written on: | 2019-11-06 |
| Updated on: | 2019-11-06 |