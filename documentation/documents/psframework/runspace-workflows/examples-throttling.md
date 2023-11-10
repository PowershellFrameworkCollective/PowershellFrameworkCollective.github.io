# Throttling: Don't hate your servers

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

Parallelization is a good way to swiftly hammer a server into submission under a flood of requests.
Sometimes they retaliate.

In order to avoid problems with that kind of concern, it is possible to include throttling when creating a worker.

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Throttling'

$throttle = New-PSFThrottle -Interval '3s' -Limit 5
$workflow | Add-PSFRunspaceWorker -Name S1 -InQueue Q1 -OutQueue Q2 -Count 10 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Value = $Value
        Stage1 = Get-Date
        Stage2 = $null
    }
} -CloseOutQueue
$workflow | Add-PSFRunspaceWorker -Name S2 -InQueue Q2 -OutQueue Q3 -Count 10 -ScriptBlock {
    param ($Value)
    $Value.Stage2 = Get-Date
    $Value
} -CloseOutQueue -Throttle $throttle

$workflow | Write-PSFRunspaceQueue -Name Q1 -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName S2 -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Q3 -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

> Wait until

Sometimes, web services tell us how long we should be waiting for the next request.
This can be done with some slight adjustments:

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Throttling2'

$throttle = New-PSFThrottle -Interval '1m' -Limit 100
$workflow | Add-PSFRunspaceWorker -Name S1 -InQueue Q1 -OutQueue Q2 -Count 1 -ScriptBlock {
    param ($Value)
    Start-Sleep -Milliseconds 200
    [PSCustomObject]@{
        Value = $Value
        Stage1 = Get-Date
        Stage2 = $null
    }
} -CloseOutQueue
$workflow | Add-PSFRunspaceWorker -Name S2 -InQueue Q2 -OutQueue Q3 -Count 2 -ScriptBlock {
    param ($Value)
    if (10 -eq $Value.Value) {
        $__PSF_Worker.Throttle.NotBefore = (Get-Date).AddSeconds(10)
    }
    $Value.Stage2 = Get-Date
    $Value
} -CloseOutQueue -Throttle $throttle

$workflow | Write-PSFRunspaceQueue -Name Q1 -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName S2 -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Q3 -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

> Note: The variable `$__PSF_Worker` represents the worker of the current runspace and is available in [all three phases](examples-begin-end.html) of the worker.

## Queue Capacity Limits

Sometimes we may want to limit, just how large a backlog a worker can generate.
In this case, we can assign a queue capacity limit - any attempt to add to it beyond that limit is going to block the caller until another runspace removes an item from that queue.

Be aware that this carries the risk of deadlocks or hanging workers if misused.

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-Throttling3'

# Limit Q2 to no more than 5 items
$workflow.Queues.Q2.MaxItemCount = 5

$workflow | Add-PSFRunspaceWorker -Name S1 -InQueue Q1 -OutQueue Q2 -Count 1 -ScriptBlock {
    param ($Value)
    [PSCustomObject]@{
        Value = $Value
        Stage1 = Get-Date
        Stage2 = $null
    }
} -CloseOutQueue
$workflow | Add-PSFRunspaceWorker -Name S2 -InQueue Q2 -OutQueue Q3 -Count 2 -ScriptBlock {
    param ($Value)
    Start-Sleep -Second 1
    $Value.Stage2 = Get-Date
    $Value
} -CloseOutQueue

$workflow | Write-PSFRunspaceQueue -Name Q1 -BulkValues (1..20) -Close
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName S2 -Closed -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name Q3 -All
$workflow | Remove-PSFRunspaceWorkflow

$results
```

Note how in this log the first ~10 values are on the same second in Stage1, thereafter moving to 2/second to match the processing speed of S2.

## Next Steps

+ [Automatically close queues and workers when done](examples-auto-close.html)
+ [Are all workflows a linear processing chain?](examples-multi-pronged-flows.html)

[Back to Runspace Workflows](../runspace-workflows.html)