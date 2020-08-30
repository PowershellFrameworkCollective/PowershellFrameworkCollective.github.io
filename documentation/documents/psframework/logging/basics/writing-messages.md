# Writing Messages

> [Back to: Logging](../../logging.html)

## What is a Message?

Before we start into the details, it may be valuable to define what Messages are all about.
With all the different ways in which a piece of PowerShell can communicate and transmit information, it is easy to go wrong with the best intentions.

Fundamentally, in PowerShell it filters down to two scenarios:

- Output: Information that represents the result of an action or the data requested.
Generally for further processing down the road - e.g. by piping it to the next command.
- Message: A communication with the user, a status update, an "I'm currently doing XY" message, showing progress.
A debugging info to figure out why things broke.

> This distinction and its consequences has been further documented in [this blog post](https://allthingspowershell.blogspot.com/2017/12/puppycide-done-right-output-versus.html).

## What does a Message contain?

In the `PSFramework`, a message is a rich data object, offering valuable debugging information.
In order to maximize the benefit, both the code you write as well as the system provide pieces of information.

> What the user should/can provide

+ Message: A message text, intended for human consumption
+ Level: The [message level](message-levels.html) governs its visibility - what PowerShell streams the message gets written to and how likely the user is to see it printed on screen.
+ Tags: Tags are labels that can later be used to search and filter messages by. This can help a lot when analyzing logs. You can also apply policies to tags - for example, you can configure [Logging Providers](logging-providers.html) to ignore or look for specific tags.
+ Target: A piece of information representing the target operated against (e.g. Computer name, Mailbox, etc.) to allow tracking for everything done to a specific target
+ Data: Arbitrary additional data pieces, that may or may not be respected by the individual [Logging Provider Instance](logging-providers.html)
+ Error Record: If the message was written in response to code causing errors

> What the system adds

+ Module & Function Name: To better figure out where in the code it happened
+ File & Line: For better tracking, but not always available
+ Script Callstack: To track the causality chain
+ Username & Computername: Useful when aggregating logs from multiple machines
+ Timestamp
+ Runspace: Allows tracking action by the thread they happened on. Useful when parallelizing.

## How to write messages

There are several commands that allow you to write messages.

> Many of these commands are also part of the [Flow Control Component](../../flow-control.html)

|Command|Description|
|---|---|
|[Write-PSFMessage](../../../../commands/PSFramework/Write-PSFMessage.html)|The most commonly used command to write messages. It gives you the maximum flexibility in what to write.|
|[Stop-PSFFunction](../../../../commands/PSFramework/Stop-PSFFunction.html)|Part of the [Flow Control Component](../../flow-control.html), it combines message handling with error handling.|
|[Invoke-PSFProtectedCommand](../../../../commands/PSFramework/Invoke-PSFProtectedCommand.html)|Part of the [Flow Control Component](../../flow-control.html), it combines message handling with error handling, should process and retry logic.|

### Write-PSFMessage

As the default command to use when writing messages, expect to see a lot of this command.

A simple message could look like this:

```powershell
Write-PSFMessage -Message "Test Message"
```

> Without specifying a [level](message-levels.html), the message will be written to the [Verbose level](message-levels.html).

To make the message more visible, we could instead set the [Level](message-levels.html) to `Host`:

```powershell
Write-PSFMessage -Level Host -Message "Message visible to the user"
```

Some internal debugging message could instead be written like this:

```powershell
Write-PSFMessage -Level Debug -Message "Very well hidden message"
```

Finally, if we want to really put the user on notice, there is also the Warning level:

```powershell
Write-PSFMessage -Level Warning -Message "Warning Message"
```

> Improving the ability to analyze logs / messages

The key tools to enable analyzing large log data is adding targets and tags.
When doing said analysis, we generally come from one of either of these two direction:

+ What happened to XYZ?
+ How many events of type ABC did we have?

Tags allow you to classify events, setting Targets allows you to track the subject you are processing.

Examples:

```powershell
# Target
Write-PSFMessage -Message "Installing update $($update.KBNumber)" -Target $ComputerName

# Tag
Write-PSFMessage -Message "Connecting to database" -Tag connect, database

# Both
Write-PSFMessage -Level Warning -Message "Failed to install update $($update.KBNumber)" -Target $ComputerName -Tag update, failed, error -ErrorRecord $_
```

> Dealing with Errors

The simple way to add errors to messages is using the `-ErrorRecord` parameter, such as like this:

```powershell
try { $null.ToString() } # this will fail
catch { Write-PSFmessage -Level Warning -Message "Failed operation" -ErrorRecord $_ }
```

This will attach the full error record to the message:

```powershell
(Get-PSFMessage | Select-Object -last 1).ErrorRecord | Format-List -Force
```

Allowing you to analyze the actual error in the [In-Memory debug log](inmemory-debuglog.html).
It will _also_ add the error message to the message written to screen if not already included, so you need to do nothing to pass it along to the end user.
Important though: Adding an error record will _not_ automatically turn the message into a warning.
You still need to explicitly set the [Level](message-levels.html) to a user-visible [Level](message-levels.html) if you want the user to see the message.

If you do not want the system to attach the original error message (e.g. when that message is misleading and you added a more user friendly message), you can disable this with the `-OverrideExceptionMessage` parameter:

```powershell
try { $null.ToString() } # this will fail
catch { Write-PSFmessage -Level Warning -Message "Failed operation" -ErrorRecord $_ -OverrideExceptionMessage }
```

> Adding Data

The `-Data` parameter allows you to add additional arbitrary data.
In opposite to the rest of the message properties, there is no promised compatibility or implementation for the `Data` field in respect to [Logging Providers](logging-providers.html).
Some [Logging Providers](logging-providers.html) may implement it, others may not or only partially.

You can find the supportability info in the stats on each respective [Provider's](../../logging.html) status sheet.

Data will always be fully accessible in the [In-memory debug log](inmemory-debuglog.html).

Example adding data:

```powershell
Write-PSFMessage -Message 'Restarting computer' -TargetObject $ComputerName -Data @{
    UpdatesInstalled = $updatesInstalled
    UpdatesPending = $pending
    InstallDuration = $duration
}
```

### Stop-PSFFunction

As previously mentioned, [Stop-PSFFunction](../../../../commands/PSFramework/Stop-PSFFunction.html) is a major part of the [Flow Control Component](../../flow-control.html).
Its main purpose is implementing the [opt-in exception user-experience](../../flow-control/opt-in-exceptions.html).

From a message perspective, it offers less tuning options than [Write-PSFMessage](../../../../commands/PSFramework/Write-PSFMessage.html), but the ones it does match 1:1.

All messages generated thus ...

+ Will be at `Warning` [Level](message-levels.html)
+ Will have an error record attached, whether you specify one or not.

If the function is called in terminating exception mode, by default, the warning will be suppressed (but written to log), giving the terminating exception precedence.
There is a Feature Flag to write the warning anyway.
Feature Flags can be set at module level or globally.

If you want your module's calls to `Stop-PSFFunction` to always show warnings, run the following line during module import:

```powershell
Set-PSFFeature -Name PSFramework.Stop-PSFFunction.ShowWarning -Value $true -ModuleName MyModule
```

To define this setting globally for the entire PowerShell session, omit the module name:

```powershell
Set-PSFFeature -Name PSFramework.Stop-PSFFunction.ShowWarning -Value $true
```

> The choice to set a feature at global level should not be made by a module, but by the user her-/himself.

Example use of `Stop-PSFFunction`:

```powershell
Stop-PSFFunction -Message "Failed to delete $Path" -ErrorRecord $_ -EnableException $EnableException
return
```

### Invoke-PSFProtectedCommand

[Invoke-PSFProtectedCommand](../../../../commands/PSFramework/Invoke-PSFProtectedCommand.html) too is part of the [Flow Control Component](../../flow-control.html) and can tie into the [opt-in exception user-experience](../../flow-control/opt-in-exceptions.html).
Its main purpose however is to simplify error handling and `ShouldProcess` support.
See its [dedicated feature page](../../flow-control/invoke-psfprotectedcommand.html) to learn how it can simplify your implementation of advanced reliability features in PowerShell.

However, from a message perspective, it will automatically write the following messages:

+ Was the planned action denied execution (e.g. by using -WhatIf or denying -Confirm)?
+ Was the planned action allowed to execute?
+ Was the executed action successful or not?
+ For each retry, whether it succeeded
+ When the last retry is exhausted, it will notify giving up

The command supports several of the options `Write-PSFmessage` supports (e.g. Tags) and requires specifying a target.
This provides significant simplification in your flow control, while providing rich log analysis data.

Example use:

```powershell
Invoke-PSFProtectedCommand -Action Delete -Target $Path -ScriptBlock {
    Remove-Item -Path $Path -Recurse -Force -Confirm:$false -ErrorAction Stop
} -EnableException $EnableException -Continue
```

## Message vs. String

If you inspect the above.mentioned command's syntax, you will notice that all of them have two parameter sets:

+ One using `-Message` or `-Action`
+ The other using `-String` or `-ActionString`

Both result in effectively the same message, the difference is in how that message is put together, how _you_ need to provide its data.
The latter option is used to implement [multilingual messages](multilingual.html)!
It requires you to prepare one or several strings files that map string keys to their message text in each file's respective language.
In the `-String`/`-ActionString` parameter you then specify the key to use.

This would allow you to prepare messages in multiple languages and offer them in the language most convenient to a given user.

> The _Logging_ Language is independent of the display language!
You can show warnings in Mandarin and still write logs in English.

> [Back to: Logging](../../logging.html)
