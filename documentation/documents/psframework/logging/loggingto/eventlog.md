> [Back to: Logging](../../logging.html)

## Setting up logging

To enable basic logging to the Windows Eventlog, run this:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'eventlog'
    InstanceName = 'MyTask'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

This will enable logging as source "PSFramework" in the Application eventlog.
If that source does not exist yet it will try to create it.
If that fails, it will log as source "Application" instead.

> Customizing the target

To customize where and as who the log is written, you can specify log and source as settings/parameter:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'eventlog'
    InstanceName = 'MyTask'
    LogName      = 'SriptLog'
    Source       = 'MyTask'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

## Generating Messages

You can write messages using the `Write-PSFMessage` cmdlet, which functionally replaces Write-Verbose, Write-Host, Write-Warning, Write-Debug or Write-Log:

```powershell
# Verbose
Write-PSFMessage -Message "Test Message"

# Host
Write-PSFMessage -Level Host -Message "Message visible to the user"

# Debug
Write-PSFMessage -Level Debug -Message "Very well hidden message"

# Warning
Write-PSFMessage -Level Warning -Message "Warning Message"
```

You can also add tags for better filtering:

```powershell
Write-PSFMessage -Message "Tagged Message" -Tag special, custom, whatever
```

Specify the target you are working against to better track actions relating to that specific target:

```powershell
Write-PSFMessage -Message "Doing something" -Target $ComputerName
```

For more details on how to generate messages, [see the dedicated documentation page](../basics/writing-messages.html)

## Using the log

One of the key things to keep in mind:
Each eventlog entry actually contains rich information on the message object.
It only shows the message on the UI, but there are a lot more fields of the message object on it.

Example:

```xml
<EventData>
  <Data>Creating file: þnameþ.ps1 ()</Data>
  <Data>2020-08-20 08:14:03.981</Data>
  <Data>Invoke-PSMDTemplate</Data>
  <Data>PSModuleDevelopment</Data>
  <Data>create,template</Data>
  <Data>Verbose</Data>
  <Data>0b411936-a0a1-4fa3-af7d-991e19297188</Data>
  <Data />
  <Data>C:\Program Files\WindowsPowerShell\Modules\PSModuleDevelopment\2.2.8.104\PSModuleDevelopment.psm1</Data>
  <Data>4291</Data>
  <Data>At Write-TemplateItem, C:\Program Files\WindowsPowerShell\Modules\PSModuleDevelopment\2.2.8.104\PSModuleDevelopment.psm1: Line 4291 At Invoke-Template, C:\Program Files\WindowsPowerShell\Modules\PSModuleDevelopment\2.2.8.104\PSModuleDevelopment.psm1: Line 4188 At Invoke-PSMDTemplate<Process>, C:\Program Files\WindowsPowerShell\Modules\PSModuleDevelopment\2.2.8.104\PSModuleDevelopment.psm1: Line 4379 At <ScriptBlock>, <none>: Line 1</Data>
  <Data>CONTOSO\testuser</Data>
  <Data>17388</Data>
  <Data>6f2e8652-7b85-4ac3-8b2e-3ce4f578edef</Data>
</EventData>
```

The Properties are, in their order, Message, Timestamp (utc), FunctionName, ModuleName, Tags, Level, Runspace, TargetObject, File, Line, Callstack, Username, ProcessID, LoggingID

> LoggingID

To ensure the ability to track down each task individually, when starting up an instance, it auto-generates an ID - the LoggingID - that is unique and attached to every single message written from that provider.

This GUID is the last entry on each message.

> Retrieving & restoring data from EventLog

Using PowerShell and PSFramework in particular, re-converting eventlog entries into PowerShell Objects is simple enough:

```powershell
Get-WinEvent -FilterXml @'
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">*[System[Provider[@Name='PSFramework']]]</Select>
  </Query>
</QueryList>
'@ | Where-Object { $_.Properties.Count -ge 14 } | Select-PSFObject @(
    'Properties[0].Value as Message'
    'Properties[1].Value as Timestamp to DateTime'
    'Properties[2].Value as FunctionName'
    'Properties[3].Value as ModuleName'
    'Properties[4].Value as Tags'
    'Properties[5].Value as Level'
    'Properties[6].Value as Runspace'
    'Properties[7].Value as TargetObject'
    'Properties[8].Value as File'
    'Properties[9].Value as Line to Int'
    'Properties[10].Value as Callstack'
    'Properties[11].Value as Username'
    'Properties[12].Value as ProcessID to Int'
    'Properties[13].Value as LoggingID'
)
```

To obtain the list of started instances:

```powershell
Get-WinEvent -FilterXml @'
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">*[System[Provider[@Name='PSFramework'] and (EventID=999)]]</Select>
  </Query>
</QueryList>
'@ | Select-PSFObject @(
    'Properties[2].Value as InstanceName'
    'Properties[3].Value as LoggingID'
    'Properties[1].Value as ProcessID'
    'TimeCreated.ToUniversalTime() as StartTime'
)
```

The two datasets can also conveniently be combined:

```powershell
$instances = Get-WinEvent -FilterXml @'
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">*[System[Provider[@Name='PSFramework'] and (EventID=999)]]</Select>
  </Query>
</QueryList>
'@ | Select-PSFObject @(
    'Properties[2].Value as InstanceName'
    'Properties[3].Value as LoggingID'
    'Properties[1].Value as ProcessID'
    'TimeCreated.ToUniversalTime() as StartTime'
)

Get-WinEvent -FilterXml @'
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">*[System[Provider[@Name='PSFramework']]]</Select>
  </Query>
</QueryList>
'@ | Where-Object { $_.Properties.Count -ge 14 } | Select-PSFObject @(
    'Properties[0].Value as Message'
    'Properties[1].Value as Timestamp to DateTime'
    'Properties[2].Value as FunctionName'
    'Properties[3].Value as ModuleName'
    'Properties[4].Value as Tags'
    'Properties[5].Value as Level'
    'Properties[6].Value as Runspace'
    'Properties[7].Value as TargetObject'
    'Properties[8].Value as File'
    'Properties[9].Value as Line to Int'
    'Properties[10].Value as Callstack'
    'Properties[11].Value as Username'
    'Properties[12].Value as ProcessID to Int'
    'Properties[13].Value as LoggingID'
) | Select-PSFObject *, 'InstanceName FROM instances WHERE LoggingID = LoggingID'
```

## Logging Provider Documentation

For more detailed docs, [see the full documentation for the Eventlog logging provider](../providers/eventlog.html)

> [Back to: Logging](../../logging.html)
