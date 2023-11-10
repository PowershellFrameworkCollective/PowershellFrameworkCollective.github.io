# Automatically Closing Queues and Workers

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

One of the issues with this parallel executing workflow is "How do I know when I'm done?".
A worker and its runspaces have no idea, where in the processing sequence they are and whether new input is going to arrive.

As a matter of fact, the entire workflow is unaware of this, the original input always comes from outside of it and there is nothing preventing the script using it from adding more input at a later time.
Thus the concept of "closing queues" was introduced:
A queue can, at any time, be closed - a flag that prevents any further data from being added to it.

A worker using that queue as input will then know, not to expect any further input and can close itself.
Once every runspace of a worker is done, it can then - if so configured - close its own out queue, as it knows it will never add another item to it.
Which then signals the next worker, using _that_ queue as input that no more data will be forthcoming.

In the end, the entire chain of workers can use this mechanism to end itself, halting the entire workflow.

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Closing'

$workflow | Add-PSFRunspaceWorker -Name Processing -InQueue Input -OutQueue Processed -Count 3 -ScriptBlock {
    param ($Value)

    [PSCustomObject]@{
        Input = $Value
        Processed = $Value * 2
        Result = $null
    }
} -CloseOutQueue
$workflow | Add-PSFRunspaceWorker -Name Result -InQueue Processed -OutQueue Done -Count 2 -ScriptBlock {
    param ($Value)

    $Value.Result = $Value.Processed * 3
    $Value
} -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues (1..1000) -Close
$workflow | Start-PSFRunspaceWorkflow

$workflow | Wait-PSFRunspaceWorkflow -WorkerName Result -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Done -All
$workflow | Remove-PSFRunspaceWorkflow
```

+ The `-CloseOutQueue` switch parameter on `Add-PSFRunspaceWorker` tells the worker to close its out-going queue, once it knows it cannot receive more input. This happens when its input queue has been closed _and all remaining items processed_ or its `MaxItems` count has been reached (and processed).
+ The `-Close` parameter on `Write-PSFRunspaceQueue` has the effect of immediately closing the queue after adding values to it. Usually used with the original input queue after having added all input needed.
+ The `Wait-PSFRunspaceWorkflow` command can wait for a specific worker or queue is closed, avoiding the need to specify just how many items to wait for.

> MaxItems

Another way for a worker to know when to be done, is by telling it, just how many items it is supposed to process.
This is done via the `-MaxItems` parameter on the `Add-PSFRunspaceWorker` command:

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-MaxItems'

$workflow | Add-PSFRunspaceWorker -Name Processing -InQueue Input -OutQueue Processed -Count 3 -ScriptBlock {
    param ($Value)

    [PSCustomObject]@{
        Input = $Value
        Processed = $Value * 2
        Result = $null
    }
} -CloseOutQueue -MaxItems 10 # Stop after the first 10 items
$workflow | Add-PSFRunspaceWorker -Name Result -InQueue Processed -OutQueue Done -Count 2 -ScriptBlock {
    param ($Value)

    $Value.Result = $Value.Processed * 3
    $Value
} -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues (1..1000)
$workflow | Start-PSFRunspaceWorkflow

$workflow | Wait-PSFRunspaceWorkflow -WorkerName Result -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Done -All
$workflow | Remove-PSFRunspaceWorkflow

$results.Count # 10
```

> QueuesToClose

The `Add-PSFRunspaceWorker` function also has a `-QueuesToClose` parameter, which allows a worker to close more than one queue when it is done.
While not necessarily needed in most scenarios, it might come in handy when implementing [non-linear workflows](examples-multi-pronged-flows.html).

## Next Steps

+ [How do I avoid spamming a service with too many requests?](examples-throttling.html)
+ [Are all workflows a linear processing chain?](examples-multi-pronged-flows.html)
+ [Are queues all we have to exchange data?](examples-the-data-field.html)

[Back to Runspace Workflows](../runspace-workflows.html)