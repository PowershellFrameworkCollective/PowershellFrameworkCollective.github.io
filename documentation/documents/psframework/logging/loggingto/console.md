# Logging to: Console

> [Back to: Logging](../../logging.html)

## Setting up logging

> Logging to the console will interfer with your interactive console experience.
> This provider is meant for use in CI/CD environments!
>
> For messages written to screen in interactive situations, look into using visible-by-default [Message Levels](../basics/message-levels.html).

This command will configure the logging:

```powershell
Set-PSFLoggingProvider -Name console -Enabled $true -Style '%Message%' -Wait
```

When now generating messages:

```powershell
Write-PSFMessage -Message "Test Message"
```

The text shown on console will be:

```text
Test Message
```

## Placeholders

Each available placeholder starts and ends with a "%".
Available Placeholders:

|Message|The message that was actually logged|
|Time|The time the message was written at in "HH:mm:ss.fff" format. E.g.: "14:12:47.453"|
|Date|The date the message was written at in "yyyy-MM-dd" format. E.g.: "2021-01-17"|
|Tags|The tags that were part of the message. E.g.: "error, failed, connect"|
|Level|The level the message was written at. E.g.: "warning"|
|Module|The module that wrote the message. E.g.: "PSFramework"|
|FunctionName|The function that generated the message|
|Line|The line number in the file from which the message was written|
|File|The file path from which the message was written|

A few example Styles and what the output would look like:

```text
%Time% %Message%

14:02:08.229 Test Message
```

```text
[%Level%] %Message%

[Warning] %Test Message
```

```text
%File% : %Line%`n  [%Level%] %Message%

C:\scripts\demo.ps1 : 14
  [Verbose] Test Message
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

## Logging Provider Documentation

For more detailed docs, [see the full documentation for the sql logging provider](../providers/console.html)

> [Back to: Logging](../../logging.html)
