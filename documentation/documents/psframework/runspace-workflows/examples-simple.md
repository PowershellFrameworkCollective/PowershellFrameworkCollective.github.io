# Example: A simple workflow

[Back to Runspace Workflows](../runspace-workflows.html)

## Description

On a fundamental level, to get this system to work, we need to take the following steps:

1. Create a Runspace Workflow
2. Add a worker for each step
3. Add the original input
4. Start the Workflow
5. Wait until it is completed
6. Receive results and end

### 1: Creating a Runspace Workflow

First we need to create a new [workflow object](workflow.html):

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow'
```

This is where all the other pieces of the puzzle get added to.
It is also registered within the PSFramework module, so you can later retrieve it using `Get-PSFRunspaceWorkflow`.

We store it in a variable, as the later step require the object anyway.

### 2: Adding the workers

The workers perform the actual logic of the workflow.
For the sake of this example, we are performing a simple mathematical operation (something everybody can run on their own machine without any further dependencies).

> 2a: The First Worker

We take the input and generate an object that will end up showing the original input, the result after the first calculation (Processed) and later the final result after the second worker (Result).

```powershell
$workflow | Add-PSFRunspaceWorker -Name Processing -InQueue Input -OutQueue Processed -Count 3 -ScriptBlock {
    [PSCustomObject]@{
        Input = $_
        Processed = $_ * 2
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

> 2b: The Second Worker

In the second step, we will take the object produced by the first worker and calculate the `.Result` property, before passing it on

```powershell
$workflow | Add-PSFRunspaceWorker -Name Result -InQueue Processed -OutQueue Done -Count 2 -ScriptBlock {
    $_.Result = $_.Processed * 3
    $_
}
```

### 3: Add the original input

Workers get their work orders from their `InQueue`.
But how does the first worker receive its input?

Well, we need to provide that information using `Write-PSFRunspaceQueue`:

```powershell
$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues (1..1000)
```

### 4: Start the workflow

Once we are ready, we can launch the workflow, which will cause each worker to start its runspaces and will make things happen:

```powershell
$workflow | Start-PSFRunspaceWorkflow
```

This will take a moment, but then things are happening in the background and we can either wait for it to complete or move on and do other things in the meantime.
We can also add more input after it is already running, repeating step 3 as needed.

### 5: Waiting for the Workflow to complete

If we want to wait until everything is done, we can use the `Wait-PSFRunspaceWorkflow` command.
There are different criteria based on which it can know to workflow is done, but in our current example, we assume once 1000 results have been gathered in the `Done` queue (the output of the second worker), our workflow is complete.

```powershell
$workflow | Wait-PSFRunspaceWorkflow -Queue Done -Count 1000
```

We should also stop the workflow at that point, as otherwise the background runspaces will remain open:

```powershell
$workflow | Stop-PSFRunspaceWorkflow
```

This can be condensed to:

```powershell
$workflow | Wait-PSFRunspaceWorkflow -Queue Done -Count 1000 -PassThru | Stop-PSFRunspaceWorkflow
```

Other examples show different ways for `Wait-PSFRunspaceWorkflow` to know when the workflow is done.
The [workers might know when they are done](examples-auto-close.html), for example.
But that is a story for documentation page other than the introductory example.

### 6: Results and Cleanup

Once everything has completed, it is time to receive the results (if any) and clean up the workflow:

```powershell
# Retrieve results
$results = $workflow | Read-PSFRunspaceQueue -Name Done -All

# Final Cleanup
$workflow | Remove-PSFRunspaceWorkflow
```

With that we have the result of the workflow in `$results` and everything is over.
There are more complex examples, that better show the benefit provided by this system (e.g. [Gathering data from Exchange Online, adding Active Directory information to it, then finally export everything to csv](examples-first-step-data.html)), but the flow shown above are the simple, basic implementation answering the "how?" question.

## End-To-End Example

Summarizing the explanation above, here is the full example script in one package:

```powershell
# Create Workflow
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow'

# Add Workers
$workflow | Add-PSFRunspaceWorker -Name Processing -InQueue Input -OutQueue Processed -Count 3 -ScriptBlock {
    [PSCustomObject]@{
        Input = $_
        Processed = $_ * 2
        Result = $null
    }
}
$workflow | Add-PSFRunspaceWorker -Name Result -InQueue Processed -OutQueue Done -Count 2 -ScriptBlock {
    $_.Result = $_.Processed * 3
    $_
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

## Next Steps

+ [What if there is no real input and the first step is supposed to generate it?](examples-first-step-data.html)
+ [Providing variables, functions or modules to the worker code](examples-resources.html)
+ [So we have Process, but where are my Begin and End blocks?](examples-begin-end.html)

[Back to Runspace Workflows](../runspace-workflows.html)