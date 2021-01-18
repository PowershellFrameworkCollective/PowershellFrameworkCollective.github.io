# Logging Provider: Console

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to Console](../loggingto/console.html)

## Description

Logs messages to the console screen.

This is intended for use in CI/CD scenarios, where the console screen is all that is shown by default.
As this will spam the user console, in interactive mode it will likely be highly inconvenient.

Not to be confused with the written text from `Write-PSFMessage`, this [Logging Provider](../basics/logging-providers.html) fully ignores any verbosity settings.
If [writing a message](../basics/writing-messages.html) at a visible [message level](../basics/message-levels.html) with an instance of this Provider active, both the message and the log entry will be visible on screen.

## Stats

|Name|console|
|Version|2|
|ConfigurationRoot|PSFramework.Logging.Console|
|Supports Data|False|
|Installation|Not Required|

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|Style|%Message%|The style in which the message is printed. Supports several placeholders: %Message%, %Time%, %Date%, %Tags%, %Level%, %Module%, %FunctionName%, %Line%, %File%. Supports newline and tabs.|

> [Back to: Logging](../../logging.html)
