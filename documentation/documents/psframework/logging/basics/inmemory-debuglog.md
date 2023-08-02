# The in-memory debug log

> [Back to: Logging](../../logging.html)

## Description

The in-memory debug log is a logging queue that is automatically enabled and receives all [messages written](writing-messages.html), irrespective of [message policies](../advanced/message-policies.html).
It is completely outside the [Logging Provider](logging-providers.html) system.

All messages from _all_ runspaces end up in the same in-memory debug log.
Writing to that log is a synchronous operation, other than the action of writing to logs through the [Logging Provider instances](logging-providers.html).

## Reading the debug log

To read that debug log, you can use the [Get-PSFMessage](../../../../commands/PSFramework/Get-PSFMessage.html) command.
It includes a lot of parameters that allow filtering messages flexibly.

This log is designed to be especially useful for debugging during development.
It also allows instant forensics without having to rerun a command/script with `-Verbose`.

> This log is fully file-less and will be lost if the process is closed.
> For after the fact logging, look for the [File System Logging Provider](../providers/filesystem.html) and the general guidance on the [debug log](../loggingto/debuglog.html).

> By default, only the *last 1024* messages will be retained.

## The Error log

When [writing messages](writing-messages.html) it is quite possible to write / pass through error records.
These are often of special interest for debugging purposes.

Due to this, the in-memory log has a dedicated logging queue for logged error records.
These have a separate retention of (by default) the *last 128* errors being retained, irrespective of the number of non-error messages.

Due to that, even a lengthy task that writes a vast amount of messages will not hide the last errors.

To access the error log, use [Get-PSFMessage](../../../../commands/PSFramework/Get-PSFMessage.html)'s `-Errors` switch parameter.

## Clearing the log

You may sometimes want to clear the log between test run, to only have the current entries from the latest run in there.
There is a way to do that easy: `Clear-PSFMessage` will handle that in one, neat call:

```powershell
Clear-PSFMessage
```

No parameters needed.

## Configuring the debug log

There are separate configuration settings governing the in-memory debug log.
Each of the log queues can be separately enabled/disabled and resized.

> Note: The default size was chosen to prevent large amounts of memory being consumed.
> Keep that concern in mind if you decide to permanently increase the capacity.
> The exact memory cost per message is hard to gauge, as provided extra data and targeting information can vastly increase individual message's size.

> Configuration Namespace: `PSFramework.Logging`

|Name|Default Value|Description|
|---|---|---|
|MaxMessageCount|1024|The maximum number of messages that can be maintained in the in-memory message queue.|
|MaxErrorCount|128|The maximum number of error records maintained in-memory.|
|MessageLogEnabled|True|Governs, whether a log of recent messages is kept in memory.|
|ErrorLogEnabled|True|Governs, whether a log of recent errors is kept in memory.|

For more details on how to apply these settings, see the [documentation on the Configuration Component](../../configuration.html).

> [Back to: Logging](../../logging.html)
