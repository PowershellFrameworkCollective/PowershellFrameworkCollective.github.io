# The Queue

[Back to Runspace Workflows](../runspace-workflows.html)

## Synopsis

The queues are the way individual workers interact with each other - one worker's output-queue becomes another worker's input queue.
The queues are hosted on the [Workflow Object](workflow.html).

Before executing the workflow, the original input of the workflow must be provided from outside of it - whether that is actual data or just a dummy value because the first worker is supposed to do the actual data collecting.

## Defining Queues

At no point will you need to "define" a queue - simply by using a queue name, it gets created as applicable:

+ Defining a worker with queue names
+ Using `Write-PSFRunspaceQueue`
+ Using `Read-PSFRunspaceQueue`
+ Accessing the queues on the [Workflow Object](workflow.html)

## Writing to the Queue

The tool of choice to write to a queue is the `Write-PSFRunspaceQueue` command:

> A Single value

```powershell
$workflow = New-PSFRunspaceWorkflow -Name QueueExample

$workflow | Write-PSFRunspaceQueue -Name Input -Value 42
```

> Multiple Values

```powershell
$workflow = New-PSFRunspaceWorkflow -Name QueueExample

$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues 42,23,1,5
```

There are different parameters for this, as otherwise it would be impossible for a collection of values (such as an array) to be provided as a single value.

> Close Call

```powershell
$workflow = New-PSFRunspaceWorkflow -Name QueueExample

$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues 42,23,1,5 -Close
```

The state of a queue is one of the ways we can determine, whether a workflow has concluded.
By [closing it](examples-auto-close.html) - as shown above - we prevent adding any more values to that queue.

A [worker](worker.html) reading from this can know, that after it finished processing the last item from such a queue, there can be no further input and it is done.

> From within a worker (Implicit)

```powershell
$result
```

All output of a worker's runspace scriptblock is automatically queued to the specified output queue.

> From within a worker (Explicit)

This only works from within the runspace of a worker:

```powershell
Write-PSFRunspaceQueue -Name user -Value $user
```

As each runspace has access to the workflow object, they can know what workflow they are a part of and where to look for a queue.
This can be useful when designing a [non-linear workflow](examples-multi-pronged-flows.html)

> Using the [Workflow Object](workflow.html)

```powershell
$workflow = New-PSFRunspaceWorkflow -Name QueueExample

# As mentioned above: No need to explicitly create the queue first
$workflow.Queues.Input.Enqueue(42)
```

## Reading from a Queue

By the nature of queues, reading from it and removing the item from it are usually synonymous.
Due to that, it is generally only useful to read from the output queue of the final worker.

That said, the usual command to read from a queue is `Read-PSFRunspaceQueue`.

> Read one Item

```powershell
$workflow = Get-PSFRunspaceWorkflow -Name QueueExample

$workflow | Read-PSFRunspaceQueue -Name Result
```

> Read all that remains in the queue

```powershell
$workflow = Get-PSFRunspaceWorkflow -Name QueueExample

$workflow | Read-PSFRunspaceQueue -Name Result -All
```

> From within a worker (Implicit)

All worker runspaces automatically retrieve input from the queue configured for their input and provide that as an argument to the worker scriptblock.
Inside that code, simply define a param block to bind it to a proper variable:

```powershell
param ($Value)
```

For a simple example. [check out the introductory example](examples-simple.html)

> From within a worker (Explicit)

As the worker is aware of what workflow it is part of, reading from a specific queue of your choice is simpler:

```powershell
Read-PSFRunspaceQueue -Name input
```

As this is usually not needed - a worker runspace receives its input as argument (see above) - this is a less likely scenario, but the precursor of a more interesting option:

> Continual Output

This is intended within a worker that needs to pipe values from a queue to another command:

```powershell
Read-PSFRunspaceQueue -Name mail -Continual | Get-Mailbox
```

With that a steady stream of input values will be piped to the subsequent command, `Read-PSFRunspaceQueue` blocking, waiting for the next item, until its queue [gets closed](examples-auto-close.html).

> Using the [Workflow Object](workflow.html)

```powershell
$workflow = Get-PSFRunspaceWorkflow -Name QueueExample

# As mentioned above: No need to explicitly create the queue first
$workflow.Queues.Output.Dequeue()
```

## Configuring Queues

Queues actually have a few settings that can be applied.
These usually are only relevant in rarer scenarios ... but then they might come in handy:

> Closing a Queue

Queues that are closed no longer accept input (they will silently ignore it).
This signals the workers that no more values can be expected from that queue and is part of signaling the end of a workflow.

This is covered extensively in the [example for closing queues](examples-auto-close.html).

To close a queue, there are two ways:

+ As part of a `Write-PSFRunspaceQueue` call (usually to finalize the original input queue; see above)
+ On the [Workflow Object](workflow.html)

```powershell
$workflow = Get-PSFRunspaceWorkflow -Name QueueExample
$workflow.CloseQueue("processing")
```

> Maximum number of Items in the queue

In really rare cases, it might be useful to prevent a queue from gathering too much data.
Imagine one worker providing data faster than the next worker can process - in the long run, this is going to bloat the memory until we run out.
Not good.

Using the `MaxItemCount` property on a queue, it becomes possible to limit the number of items that can be in a queue at any given time.
Trying to add more to it will then block the call until another thread removes an item from the queue.

Please note that this can lead to deadlocks or failed tasks (e.g. paging timeouts on the data source).

```powershell
$workflow = Get-PSFRunspaceWorkflow -Name QueueExample
$workflow.Queues.Processing.MaxItemCount = 2000
```

For more details on that and a full example implementation, see [the throttling example](examples-throttling.html)

[Back to Runspace Workflows](../runspace-workflows.html)