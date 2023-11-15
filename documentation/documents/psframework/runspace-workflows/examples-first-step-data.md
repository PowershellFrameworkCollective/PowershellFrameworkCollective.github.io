# Zero Input: When the first worker produces the information

[Back to Runspace Workflows](../runspace-workflows.html)

## Basics

A documented example of the basic workflow setup [can be found on this page](examples-simple.html).

## Description

Sometimes, we do not actually already have input at hand - instead the first step in the workflow is supposed to generate it.
A common example are classic, long-running commands, that generate data as it comes, but can't really be interrupted without massive performance penalties.
`Get-Mailbox` in a large Exchange Online environment can run for many hours.

Not only will it not require any input, but we would also like to start working on the first mailboxes, without having to wait for it all to complete ...

Well, fret not, where there is a will, there is a script.

> Note: This example leans heavily on the [begin/end setup](examples-begin-end.html).

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow-FirstStepData'

# First Worker: Get Mailboxes
$variables = @{
    exAppID = $exAppID
    exOrganization = $exOrganization
    exCert = $exCert
}
$begin = {
    Connect-ExchangeOnline -AppID $exAppID -Organization $exOrganization -Certificate $exCert
}
$process = {
    Get-EXOMailbox | Write-PSFRunspaceQueue -Name Mailboxes -WorkerName '' -InputObject $null
}
$end = {
    Disconnect-ExchangeOnline
}
$workflow | Add-PSFRunspaceWorker -Name Mailboxes -InQueue Input -OutQueue Mailboxes -Begin $begin -ScriptBlock $process -End $end -Count 1 -Variables $variables -Modules ExchangeOnlineManagement -KillToStop -CloseOutQueue

# Second Worker: Match Information from Active Directory
$process2 = {
    param ($Value)
    $adUser = Get-ADUser -LdapFilter "(mail=$($Value.PrimarySmtpAddress))"

    [PSCustomObject]@{
        SamAccountName = $adUser.SamAccountName
        SID = $adUser.ObjectSID
        DistinguishedName = $adUser.DistinguishedName
        Mail = $Value.PrimarySmtpAddress
        ProxyAddresses = $value.ProxyAddresses -join ','
    }
}
$workflow | Add-PSFRunspaceWorker -Name ADUser -InQueue Mailboxes -OutQueue ADUser -ScriptBlock $process2 -Count 10 -Modules ActiveDirectory -CloseOutQueue

# Third Worker: Write Results to CSV
$variables3 = @{ Path = 'C:\temp\users.csv' }
$begin3 = {
    $global:command = { Export-Csv -Path $Path }.GetSteppablePipeline()
    $global:command.Begin($true)
}
$process3 = {
    $global:command.Process($_)
}
$end3 = {
    $global:command.End()
}
$workflow | Add-PSFRunspaceWorker -Name CSV -InQueue ADUser -OutQueue Nothing -Begin $begin3 -ScriptBlock $process3 -End $end3 -Count 1 -Variables $variables3 -CloseOutQueue

# Add one piece of input because we need to run Mailbox exactly once
$workflow | Write-PSFRunspaceQueue -Name Input -Value 1 -Close

$workflow | Start-PSFRunspaceWorkflow
$workflow | Wait-PSFRunspaceWorkflow -WorkerName CSV -Closed -PassThru | Remove-PSFRunspaceWorkflow
```

Admittedly, not the shortest of snippets, but it's an end-to-end example of how that works.

It performs three steps:

1. Retrieve all mailboxes from Exchange Online (one runspace only)
2. Matches the mailboxes against Active Directory (10 runspaces in parallel)
3. Exports the results to CSV (one runspace only, avoiding write conflicts). The Steppable pipeline allows us to keep the CSV file open and avoid the cost of opening, parsing and closing for _each_ item.

> Note: This example used the `-CloseOutQueue`, `-Close` and `-Closed` parameters - those are designed to tell the workflow when it is done. There is a [dedicated documented example explaining just how that works](examples-auto-close.html)

## Next Steps

+ [Throttling: The Art of not Spamming the Server](examples-throttling.html)
+ [Providing different values to different Runspaces](examples-perrunspacevariables.html)
+ [The Beginning and The End](examples-begin-end.html)

[Back to Runspace Workflows](../runspace-workflows.html)