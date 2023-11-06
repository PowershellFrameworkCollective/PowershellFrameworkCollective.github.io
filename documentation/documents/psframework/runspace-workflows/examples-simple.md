# Example: A simple workflow

[Back to Runspace Workflows](../runspace-workflows.html)

## Description

On a fundamental level, to get this system to work, we need to take the following steps:

+ Create a Runspace Workflow
+ Add a worker for each step
+ Add the original input
+ Start the Workflow
+ Wait until it is completed
+ Receive results and end

```powershell
# Create Workflow
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow'

# Add Workers
$workflow | Add-PSFRunspaceWorker -Name Processing -InQueue Input -OutQueue Processed -Count 3 -ScriptBlock {
    param ($Value)

    [PSCustomObject]@{
        Input = $Value
        Processed = $Value * 2
        Result = $null
    }
}
$workflow | Add-PSFRunspaceWorker -Name Result -InQueue Processed -OutQueue Done -Count 2 -ScriptBlock {
    param ($Value)

    $Value.Result = $Value.Processed * 3
    $Value
}

# Add input
$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues (1..1000)

# Start Workflow
$workflow | Start-PSFRunspaceWorkflow

# Wait for Workflow to complete and stop it
$workflow | Wait-PSFRunspaceWorkflow -Queue Done -Count 1000 -PassThru | Stop-PSFRunspaceWorkflow

# Retrieve results
$results = $workflow | Read-PSFRunspaceQueue -Name Done -All

# Final Cleanup
$workflow | Remove-PSFRunspaceWorkflow
```

In this workflow, we have two steps:

+ Processing
+ Result

Step "Processing" executing with three parallel runspaces, step "Result" executing with two.

> Worker "Processing"

The worker "Processing" was defined like this:

```powershell
$workflow | Add-PSFRunspaceWorker -Name Processing -InQueue Input -OutQueue Processed -Count 3 -ScriptBlock {
    param ($Value)

    [PSCustomObject]@{
        Input = $Value
        Processed = $Value * 2
        Result = $null
    }
}
```

+ The `name` - "Processing" - is arbitrary, so long as it is unique. Pick something that explains what this step is about.
+ `InQueue` is the name of the queue providing the data being processed. The scriptblock gets executed once per item in that queue.
+ `OutQueue` is the name of the queue that output of the scriptblock gets written to.
+ `Count` is the number of parallel runspaces are used - in this case, three items from the `InQueue` are processed in parallel.
+ `ScriptBlock` is the logic doing the actual processing. The scriptblock receives a single input - the current item from the `InQueue` - and can be as complex as needed.
It is executed in the respective background runspace and does not see any of the outside variables, modules or commands.

## Next Steps

+ [What if there is no real input and the first step is supposed to generate it?](examples-first-step-data.html)
+ [Providing variables, functions or modules to the worker code](examples-resources.html)
+ [So we have Process, but where are my Begin and End blocks?](examples-begin-end.html)

[Back to Runspace Workflows](../runspace-workflows.html)