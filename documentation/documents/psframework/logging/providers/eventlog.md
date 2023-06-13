# Logging Provider: Eventlog

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to EventLog](../loggingto/eventlog.html)

## Description

Logs messages to the Windows Eventlog.
By default, it will log to the Application log as PSFramework, defaulting back to "Application" as source if unavailable.

For more easily associatable logging, it is strongly recommended to use a dedicated source per task.
Sources that do not exist yet will automatically be created if able to (this would usually require running as admin).

## Stats

|Name|eventlog|
|Version|2|
|ConfigurationRoot|PSFramework.Logging.EventLog|
|Supports Data|True|
|Installation|Not Required|

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|LogName|Application|Name of the log to write to. Log will NOT be created if it does not yet exist|
|Souce|PSFramework|The source under which to write. Will be created if needed and able to.|
|UseFallback|True|If the source cannot be created, should the provider fall back to using the source "Application"? Fails if not logging to the Applciation log.|
|Category|1000|What category number to use. No technical effect, but could be used to differentiate between scripts if you do not wish to create multiple sources..|
|InfoID|1000|Event ID under which an information message would be written to log.|
|WarningID|2000|Event ID under which an warning message would be written to log.|
|ErrorID|666|Event ID under which an error message would be written to log.|
|ErrorTag|error|Tag a message must have in order to be categorized as an Error when it comes to logging to eventlog.|
|TimeFormat|'yyyy-MM-dd HH:mm:ss.fff'|The time format to use for timestamps|
|NumericTagAsID|False|When set to True, purely numeric tags (e.g. '123') are used to determine the EventID if present.|
|TagToID|Null|A hashtable mapping tag on a message to an event ID.|

## Notes

### Event Properties

The message fields written to the event can be retrieved from the event properties.
They are written in the following order:

+ Message
+ Timestamp
+ Function Name
+ Module Name
+ Tags
+ Level
+ Runspace
+ TargetObject
+ File
+ Line
+ CallStack
+ Username
+ Process ID
+ Logging ID

### Logging ID

The Logging ID is a unique ID that is generated when the Logging Instance gets initialized.
As part of that initialization, it will generate an eventlog information entry with event ID 999, signaling its start.

This enables you to clearly identify individual runs of a given task, even if on each iteration it write under the same source or category.

### Data and its pitfalls

This Logging Provider supports the Data field.
On `Write-PSFMessage` there is a parameter called `-Data`.
It accepts a hashtable of additional values that may be consumed by a Logging Provider if it will.

The eventlog provider tries to do so:

As additional properties - orderwise under LoggingID - each entry in such a hashtable will be included in a format like this:

```text
Data| <key> : <value> 
```

Due to limitations in the eventlog system, there is a [maximum length of 31839 characters](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa).
Datasets that are longer will get truncated.

### Specifying the EventID with the message

> By Data Field

The Windows eventlog has theoretically the ability to classify different messages with event IDs, making it easier to filter by / monitor for specific IDs, rather than having to inspect the message more deeply.

The problem with that from a PSFramework logging perspective is that messages are not specific to a given logging provider, thus there is no parameter for an event ID.
The solution for that is the flexible `-Data` parameter on `Write-PSFMessage`.
With that we can check for a specific key and select the EventID from that.

We look for the key `'EventLog.ID'`:

```powershell
Write-PSFmessage -Message "Hello" -Data @{ 'EventLog.ID' = 1234 }
```

This also means, that the `'EventLog.ID'` key in the Data hashtable will _not_ be included in the data field as all other entries in Data are (as described in the section above)

> By numeric tag

When configuring the logging provider, you can provide a setting that will cause the instance to consider tags that are purely numeric to mean the event ID:

```powershell
$paramSetPSFLoggingProvider = @{
    Name           = 'eventlog'
    InstanceName   = 'MyTask'
    Enabled        = $true
    NumericTagAsID = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

With that, you can now provide the ID with the message via the tag field:

```powershell
# Eventlog entry with ID 123
Write-PSFMessage -Message 'Something happened' -Tag 123
```

> Mapping any tag to an ID

A second option allows you to specify an ID for any given tag (but in return means, you cannot read from the message call what ID is being assigned):

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'eventlog'
    InstanceName = 'MyTask'
    Enabled      = $true
    TagToID      = @{
        start = 1
        end = 2
    }
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

With that, you can now provide the ID with the message via the tag field:

```powershell
# Eventlog entry with ID 1
Write-PSFMessage -Message 'Something happened' -Tag start
```

> [Back to: Logging](../../logging.html)
