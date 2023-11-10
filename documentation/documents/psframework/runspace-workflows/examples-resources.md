# Resources: Providing Variables, functions and Modules

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

One of the pain points with multithreading is that while it may look similar to the rest of the script - it's still PowerShell code, right? - but does not really have access to all of that context - variables do not exist, functions are unknown - even modules might be missing, if you do not have them installed and instead load them by path!

Fortunately, providing those to a Runspace Workflow worker is quite simple:

### Variables

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Variables'

$variables = @{
    Multiplier = 3
}
$workflow | Add-PSFRunspaceWorker -Name Multiply -InQueue Numbers -OutQueue Results -Count 5 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Input = $Value
        Multiplier = $Multiplier
        Result = $Value * $Multiplier
    }
} -Variables $variables -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Numbers -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName Multiply -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Results -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

### Functions

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Functions'

function Get-RandomNumber {
	[CmdletBinding()]
	param()
	Get-Random -Minimum 10 -Maximum 99
}
$functions = @{
	'Get-RandomNumber' = (Get-Command Get-RandomNumber).Definition
}

$workflow | Add-PSFRunspaceWorker -Name Multiply -InQueue Numbers -OutQueue Results -Count 5 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Input = $Value
        Random = Get-RandomNumber
    }
} -Functions $functions -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Numbers -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName Multiply -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Results -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

> Functions and Security: Under the Aegis of Constrained Language Mode

In a secured environment, one of the main concern is what code is trusted and what code is not.
The background runspaces are trusted (even if the worker code itself is not). However, functions are injected into the runspace itself, and thus must be trusted.

When deploying code in such an environment, PSFramework needs to make sure functions should be trusted ... but it cannot determine this base on the string value of the function definition as shown above.
Simply put, if this were allowed, attackers could use this to run their code as trusted code:

````powershell
$functions = @{
	'Get-RandomNumber' = (Get-Command Get-RandomNumber).Definition
}
````

Instead, under CLM, even if the caller is a trusted source, function-code must be provided as scriptblock, rather than a string:

````powershell
$functions = @{
	'Get-RandomNumber' = [ScriptBlock]::Create((Get-Command Get-RandomNumber).Definition)
}
````

That way, PSFramework can verify the language mode (and thus trust level) of the scriptblock to ensure the function can safely be loaded into a trusted context.

### Modules

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Modules'

$workflow | Add-PSFRunspaceWorker -Name Multiply -InQueue Numbers -OutQueue Results -Count 5 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Input = $Value
        Random = Get-RandomNumber
    }
} -Modules C:\scripts\modules\MyModule\MyModule.psd1 -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Numbers -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName Multiply -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Results -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

This will pre-load the module from source to ensure the exact correct version is loaded.
It is also possible to provide just the name (e.g. `ActiveDirectory`) to pre-load the module at the beginning.

> Note: The PSFramework module is automatically added to this list.

### Initial SessionState

If the previous options are not enough, you can also add an entire pre-prepared initial session state object (The PowerShell way of defining what's initially available in a runspace):

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-SessionState'

$initialSessionState = [initialsessionstate]::CreateDefault()
$workflow | Add-PSFRunspaceWorker -Name Multiply -InQueue Numbers -OutQueue Results -Count 5 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Input = $Value
        Random = Get-RandomNumber
    }
} -SessionState $initialSessionState -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Numbers -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName Multiply -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Results -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

> Please note: If the provided session state is not enough to run the basic module code, the workflow will fail. Use very much at your own risk!

## Next Steps

+ [Providing different values to different Runspaces](examples-perrunspacevariables.html)
+ [Data outside of the queue system](examples-the-data-field.html)

[Back to Runspace Workflows](../runspace-workflows.html)