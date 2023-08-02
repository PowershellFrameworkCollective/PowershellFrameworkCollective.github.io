# Message Levels

> [Back to: Logging](../../logging.html)

## Synopsis

The level of a message determines, how likely it is for a user to see it written on screen.
It can also be applied as a filter rule for Logging Providers, to require a minimum or maximum level to apply.

By default, users will see errors, warnings, and the first three message levels (see below) on screen.

## Writing a message to a specific level

When generating a message with `Write-PSFMessage`, use the `-Level` parameter to set the level of a message.
By default, when not specifying anything, it will use the level `Verbose`.

```powershell
# Verbose
Write-PSFMessage -Message 'Some text'

# Critical
Write-PSFMessage -Level Critical -Message 'Some text'
```

## Levels and their meaning

|Level|#|Description|
|---|---|---|
|Warning|666|The warning level will automatically also write the message to the warning stream. It is outside of the usual message level range when it comes to applied rules (e.g. Logging Providers have separate filter conditions for Warnings than those used for the lower numeric ranges)|
|Error|667|The error level will automatically also write the message to the warning stream. It is outside of the usual message level range when it comes to applied rules (e.g. Logging Providers have separate filter conditions for Errors than those used for the lower numeric ranges). Some individual Logging Providers differentiate between Warnings and Errors. The Error level does _not_ affect exceptions or other flow control considerations.|
|___|___|___|
|Critical|1|A message of the highest priority. The user really should be seeing this.|
|Important/Output/Host|2|A message that is visible by default. Use this level wherever you want to replace Write-Host.|
|Significant|3|A message that is still visible by default, but of lesser importance than the previous once. Use this for messages you could see a user hide (via config) to reduce verbosity.|
|VeryVerbose|4|A verbose message of higher priority - the first level a user could enable via configuration if they want more verbose messages on screen.|
|Verbose|5|A regular, verbose message - this should be a good choice for most messages describing the code's current progress.|
|SomewhatVerbose|6|A verbose message of lesser priority, intended for adding more details and context to the current state/progress.|
|System|7|A debug level, intended to provide technical details of no interest to most users, but of use to the developer.|
|Debug|8|The default debug level. Use this for messages with developer-relevant information.|
|InternalComment|9|The least visible level, use this for whatever notes you want to include but are unlikely to be of much relevance.|

## Level Configuration Settings

As mentioned above, the level chosen affects the probability of it being shown on screen.
Irrespective of level, all messages are sent to logging (where a Logging Provider Instance might filter by level or accept them all).

However ... how does the system determine, what message goes to what stream?

For Warnings and Errors that is simple - they both go to the warning stream and should usually show as a yellow warning on screen.
For the other levels ... it depends on the following configuration settings:

|Setting|Default|Description|
|---|---|---|
|PSFramework.Message.Debug.Maximum|9|The maximum message level where debug information is still written.|
|PSFramework.Message.Debug.Minimum|1|The minimum required message level where debug information is written.|
|PSFramework.Message.Info.Maximum|3|The maximum message level to still display to the user directly.|
|PSFramework.Message.Info.Minimum|1|The minimum required message level for messages that will be shown to the user.|
|PSFramework.Message.Verbose.Maximum|6|The maximum message level where verbose information is still written.|
|PSFramework.Message.Verbose.Minimum|4|The minimum required message level where verbose information is written.|

For example, let's say we want to make all verbose messages show on screen by default, we could change the setting like this:

```powershell
Set-PSFConfig -FullName PSFramework.Message.Info.Maximum -Value 6
```

With this, even verbose messages will show by default:

```powershell
Write-PSFMessage Whatever
```

## Hacking the level - Message Level Modifiers

It is possible to define rules that change the level of a message from what it was written as.
With this you could raise (or lower) the level of all messages from a given command, module or script - making them more visible or hiding them away.

To do this, we need to create a message level modifier:

```powershell
# Emphasize messages from the module 'MyModule'
New-PSFMessageLevelModifier -Name Test1 -Modifier -9 -IncludeModuleName MyModule

# Will still be visible
Write-PSFMessage foo -Level Debug -ModuleName MyModule
```

> Since the highest level of visibility have the lowest number, _negative_ modifiers will raise the visibility of a message, while positive modifiers will lower it instead.

The filter conditions you can apply to the level modifier include ...

+ Module Name
+ Function Name / Script Name
+ Tags

Each with include and exclude options.

```powershell
# Filter by tag
New-PSFMessageLevelModifier -Name Test2 -Modifier -9 -IncludeTags fail

# Will not show
Write-PSFMessage foo -Level Debug

# Tag filter is case sensitive
Write-PSFMessage foo -Level Debug -Tag Fail

# This will show
Write-PSFMessage foo -Level Debug -Tag fail
```

> Cleaning up

To manage message level modifiers, you can also use ...

+ Get-PSFMessageLevelModifier
+ Remove-PSFMessageLevelModifier

To either see what is configured or clean up after yourself.

> Caveat: Applied before filter rules

Message Level Modifiers are applied _before_ processing the message for logging.
This means it will affect how the message is being logged, if you filter by level and the modified level will be included in the log entries, not the original value.
This might affect monitoring, if your rules watch for the level of a message.

> [Back to: Logging](../../logging.html)