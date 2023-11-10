# The Data Field: Exchanging Information without Queues

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

As shown in the basics and throughout all the other examples, the runspace workflow system depends heavily on queues to exchange data.
This has its ups - it's a central location for data and with queues, passing the data on also removes it from the queue, reducing the risk of memory leaks.

On the other hand, that does not always work all that well after all, for example when caching information in a persistent manner that workers should have access to.
That is where the `Data` dictionary of the workflow itself comes in:

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Data'

$workflow | Add-PSFRunspaceWorker -Name Multiply -InQueue Numbers -OutQueue Double -Count 2 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    if (-not $__PSF_Workflow.Data["Name"]) { $__PSF_Workflow.Data["Name"] = 'Fred' }
    $Value * 2
} -CloseOutQueue
$workflow | Add-PSFRunspaceWorker -Name Gather -InQueue Double -OutQueue Results -Count 1 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Name = $__PSF_Workflow.Data["Name"]
        Value = $Value
    }
} -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Numbers -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName Gather -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Results -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

The `$__PSF_Workflow` variable is provided to all worker runspaces and provides access to workflow information, including the thread-safe `.Data` dictionary/hashtable.
It is the exact same object as stored in the `$workflow` variable in the example above, making it absolutely possible to provide data from outside of the workflow, as an alternative to [providing variables](examples-resources.html), for example if the data should be updated and shared across all workers.

> Note: Modifying the properties on the workflow object other than the `Data` property is not recommended and might affect workflow execution.

## Next Steps

+ [Providing variables, functions or modules to the worker code](examples-resources.html)
+ [Providing different values to different Runspaces](examples-perrunspacevariables.html)
+ [Throttling: The Art of not Spamming the Server](examples-throttling.html)

[Back to Runspace Workflows](../runspace-workflows.html)