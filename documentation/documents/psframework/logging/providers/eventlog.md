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

> [Back to: Logging](../../logging.html)
