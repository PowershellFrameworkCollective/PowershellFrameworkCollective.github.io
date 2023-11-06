# Non-Linear Workflows

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

In many simple workflows, there is a strict sequence of actions taken: Step 1, then Step 2 and finally Step 3.
A linear sequence of actions, similar to commands on a single PowerShell pipeline.

Well, nothing says Runspace Workflows must be linear.

Any given worker only looks to its own `InQueue` for work orders.
Using the `Write-PSFRunspaceQueue` command it is quite possible to provide values to more than just one out queue:

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-MultiPronged'

# Define Workers
$workflow | Add-PSFRunspaceWorker -Name ADUser -InQueue Input -OutQueue Users -Count 5 -ScriptBlock {
    param ($Value)
    Get-ADUser -Identity $Value
}
$workflow | Add-PSFRunspaceWorker -Name Filter -InQueue Users -OutQueue goodUsers -Count 1 -ScriptBlock {
    param ($Value)
    if ($Value.SamAccountName -notmatch '^[a-z]{1}\d{6}[abc]$') {
        Write-PSFRunspaceQueue -Name badUsers -Value $Value
        return
    }
    $Value
}
$workflow | Add-PSFRunspaceWorker -Name BadUser -InQueue badUsers -OutQueue Completed -Count 3 -ScriptBlock {
    param ($Value)
    Send-BadUserReport -User $Value
    $Value
}
$workflow | Add-PSFRunspaceWorker -Name GoodUsers -InQueue goodUsers -OutQueue Completed -Count 3 -ScriptBlock {
    param ($Value)
    Send-GoodUserReport -User $Value
    $Value
}
$workflow | Add-PSFRunspaceWorker -Name PostProcessing -InQueue Completed -OutQueue AllUsers -Count 1 -ScriptBlock {
    param ($Value)
    $Value.SamAccountName
}

# Execute
$workflow | Write-PSFRunspaceQueue -Name Input -BulkValues (Get-Content .\users.txt)
$workflow | Start-PSFRunspaceWorkflow -PassThru | Wait-PSFRunspaceWorkflow -WorkerName PostProcessing -ReferenceQueue Users -PassThru | Stop-PSFRunspaceWorkflow
$results = $workflow | Read-PSFRunspaceQueue -Name AllUsers -All
$workflow | Remove-PSFRunspaceWorkflow
```

In this workflow we ...

+ 1: Retrieve the AD User object for each user provided to input
+ 2: Match the account against a specified pattern and either send it on to the queue for 3a (badUsers) or 3b (goodUsers)
+ 3a: Reports on bad users and sends it on to 4
+ 3b: Reports on good users and sends it on to 4
+ 4: Provides the SamAccountName of all users, irrespective of whether they come from 3a or 3b

In other words, it is perfectly fine for data flows to split between workers and queues, so long as we keep in mind how we are going to track successful conclusion.
`Wait-PSFRunspaceWorkflow` can compare the number of items that went through one worker with the total number another queue held to help make that determination, when [closing out queues](examples-auto-close.html) becomes difficult.

## Next Steps

+ [Throttling: The Art of not Spamming the Server](examples-throttling.html)
+ [Providing different values to different Runspaces](examples-perrunspacevariables.html)
+ [Data outside of the queue system](examples-the-data-field.html)

[Back to Runspace Workflows](../runspace-workflows.html)