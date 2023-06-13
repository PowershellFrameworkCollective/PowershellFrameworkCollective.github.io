# Writing Logging Providers

> [Back to: Logging](../../logging.html)

## Description

[Logging Providers](../basics/logging-providers.html) are the plugins that offer the logic that writes messages to whatever logging destination is desired.
Creating your own [Logging Providers](../basics/logging-providers.html) is very much possible and strongly recommended.

This however can seem a daunting prospect, especially when looking at the built-in providers such as the logfile provider.
To really understand this system we need to break down the components a [Logging Provider](../basics/logging-providers.html) is made of:

+ Events
+ Configuration
+ Functions
+ Metadata

## Components

### Events

Events are more fully described in the page covering the [Logging Sequence](logging-sequence.html), however basically there are six events happening and a [Logging Provider](../basics/logging-providers.html) can provider a scriptblock that should run whenever that event happens.

This is fully optional!
Except for the actual message event, all other events can be ignored.

The events that are available:

|Begin|Happens the first time the [Logging Provider](../basics/logging-providers.html) is started|
|Start|Happens at the beginning of each logging cycle|
|Message|Happens for each message to be logged|
|Error|Happens for each error record to be logged|
|End|Happens at the end of each logging cycle|
|Final|Happens as last step before shutting down your [Logging Provider](../basics/logging-providers.html).|

Of all these events, only two will receive an argument:

+ "Message" receives a message object (the same object(s) as returned by `Get-PSFMessage`)
+ "Error" receives an error object (the same object(s) as returned by `(Get-PSFMessage).ErrorRecord`)

> As the error record can also be found on the message object, using the "Error" event is not really necessary and thus no longer recommended.
> It is retained for legacy compatibility reasons only.

A simple message event scriptblock could look like this:

```powershell
$message_event = {
    param (
        $Message
    )
    [System.Console]::WriteLine($Message.LogMessage)
}
```

Yepp, that's already pretty much it.

Or to show a production message scriptblock:

```powershell
$message_event = {
    param (
        $Message
    )
    Write-SplunkMessage -Message $Message
}
```

> When to use the other events / scriptblocks?

I recommend using the "Start" event for economizing some calculations for heavy load scenarios.
For example, the [logfile](../providers/logfile.html) Provider uses that to calculate the path where it will log to, as well as the settings that govern the format.

That way, these need not be calculated for each individual message.

The "Final" event would be a great place to disconnect from a resource.

> How do I exchange data between event-scriptblocks?

To exchange data between these events, or between event and functions, use script-scope variables:

```powershell
$script:path = Get-LogPath
```

Behind the scenes, each [Instance of a Logging Provider](../basics/logging-providers.html) is actually a dynamically generated powershell module.

### Configuration

The configuration bits are what handles the information provided by the user that wants to consume your [Logging Provider](../basics/logging-providers.html).

> This is backed by the [PSFramework Configuration System](../../configuration.html).

When calling `Register-PSFLoggingProvider` you need to provide two configuration-related pieces of information (there are two optional items that are generally also good to provide).

+ ConfigurationRoot
+ InstanceProperties

> ConfigurationRoot

This is the root namespace of your configuration settings.

Let's take a look at the configuration offered by the SQL Provider.
It has four settings:

```text
PSFramework.Logging.Sql.Credential
PSFramework.Logging.Sql.Database
PSFramework.Logging.Sql.SqlServer
PSFramework.Logging.Sql.Table
```

In this example, the ConfigurationRoot would be "PSFramework.Logging.Sql".

> InstanceProperties

These are the properties each [Instance of a Logging Provider](../basics/logging-providers.html) has access to.
In the example above that would be:

```powershell
'Credential', 'Database', 'SqlServer', 'Table'
```

As mentioned, there are two optional properties you as the author can provide:

+ ConfigurationDefaultValues
+ ConfigurationSettings

> ConfigurationDefaultValues

In many cases, we don't want to force our users to define every configuration setting.
Providing sane defaults makes things a lot easier on them.

This is where the configuration default values come in.
This is a hashtable with the properties as intended.
Continuing with our example of the SQL provider:

```powershell
ConfigurationDefaultValues = @{
    'Database'  = "LoggingDatabase"
    'Table'     = "LoggingTable"
}
```

> ConfigurationSettings

Finally the configuration settings are nothing but a scriptblock defining / initializing the settings for the default instance.
This enables you to add documentation to the settings where users can discover them.
Also some validation (though that will not be carried over to the individual instances).

Again an example:

```powershell
$configuration_Settings = {
    Set-PSFConfig -Module PSFramework -Name 'Logging.Sql.Credential' -Initialize -Validation 'credential' -Description "Credentials used for connecting to the SQL server."
    Set-PSFConfig -Module PSFramework -Name 'Logging.Sql.Database' -Value "LoggingDatabase" -Initialize -Validation 'string' -Description "SQL server database."
    Set-PSFConfig -Module PSFramework -Name 'Logging.Sql.Table' -Value "LoggingTable" -Initialize -Validation 'string' -Description "SQL server database table."
    Set-PSFConfig -Module PSFramework -Name 'Logging.Sql.SqlServer' -Value "" -Initialize -Description "SQL server hosting the logs."
}
```

> Accessing settings from within events / functions

To access any setting from within an event scriptblock or a function, use `Get-ConfigValue`.

Example:

```powershell
# Retrieve the name of the table to write to
$table = Get-ConfigValue -Name Table
```

### Functions

You can provide any number of helper functions that are available from all events or to each other.
They all become part of the dynamic module that will be created at runtime and have access to any script-scope variables.

### Metadata

Some additional metadata and logic can be provided.

> Version2

You will need to set the `Version2` to `$true`.
This is the latest logging provider version, older versions should no longer be created (there is no technical benefit or reason to do so).

> IsInstalledScript

A scriptblock testing, whether everything is installed as needed to start logging.
For example, you could check for a needed module.

> InstallationScript

A scriptblock that prepares the system as needed to use the logging provider.
A common scenario would be downloading a module.

## Putting things together

With all of the above covered, let's put together a sample [Logging Provider](../basics/logging-providers.html):

```powershell
$FunctionDefinitions = {
    function Write-Console {
        [CmdletBinding()]
        param (
            $Message
        )
        $style = Get-ConfigValue -Name Style
        $string = $style.Replace('%Time%', $Message.Timestamp.ToString('HH:mm:ss.fff')).Replace('%Date%', $Message.Timestamp.ToString('yyyy-MM-dd')).Replace('%Level%', $Message.Level).Replace('%Module%', $Message.ModuleName).Replace('%FunctionName%', $Message.FunctionName).Replace('%Line%', $Message.Line).Replace('%File%', $Message.Line).Replace('%Tags%', ($Message.Tags -join ",")).Replace('%Message%', $Message.LogMessage)
        [System.Console]::WriteLine($string)
    }
}
$message_event = {
    param (
        $Message
    )
    Write-Console -Message $Message
}

$configuration_Settings = {
    Set-PSFConfig -Module 'PSFramework' -Name 'Logging.Console.Style' -Description 'The style in which the message is printed. Supports several placeholders: %Message%, %Time%, %Date%, %Tags%, %Level%, %Module%, %FunctionName%, %Line%, %File%. Supports newline and tabs.'
}
$paramRegisterPSFLoggingProvider = @{
    Name                       = "console"
    Version2                   = $true
    ConfigurationRoot          = 'PSFramework.Logging.Console'
    InstanceProperties         = 'Style'
    MessageEvent               = $message_Event
    ConfigurationSettings      = $configuration_Settings
    ConfigurationDefaultValues = @{
        Style = '%Message%'
    }
}

# Register the Console logging provider
Register-PSFLoggingProvider @paramRegisterPSFLoggingProvider
```

> [Back to: Logging](../../logging.html)
