# Per Runspace Variables

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

In some situations, it might be useful to have the same variable in all runspaces of a worker, but have each instance contain a different value.
Imagine a worker executing an API where each runspace should authenticate with different credentials to avoid throttling.

Not a problem with the `-VarPerRunspace` parameter of `Add-PSFRunspaceWorker`:

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-PerRunspaceVars'

$variables = @{
    ID = 1,2,3,4,5
}
$workflow | Add-PSFRunspaceWorker -Name Multiply -InQueue Numbers -OutQueue Results -Count 5 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Input = $Value
        Index = $ID
        Result = $Value * $ID
    }
} -VarPerRunspace $variables -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Numbers -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName Multiply -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Results -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

The `-VarPerRunspace` parameter expects a hashtable, where the key is the variable name and the value is an array of the values.
When later the runspaces for the worker get initialized, the first runspace launched will take the first of the provided values, the second runspace the next and so on, until each runspace has exactly one value from the list of values provided.
This means, the number of values provided should match the number of runspaces - providing too few values will cause some runspaces to leave the variable empty, while providing too many just means some of them do not get used at all.

## Next Steps

+ [Providing variables, functions or modules to the worker code](examples-resources.html)
+ [Throttling: The Art of not Spamming the Server](examples-throttling.html)
+ [The Beginning and The End](examples-begin-end.html)

[Back to Runspace Workflows](../runspace-workflows.html)