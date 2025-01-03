# Logging to: SQL

> [Back to: Logging](../../logging.html)

## Setting up logging

> Installation

This logging provider requires an installation step:
It uses/depends upon the [PowerShell module dbatools](https://dbatools.io).

To provide this module, you can run the following line:

```powershell
Install-PSFLoggingProvider -Name sql
```

> Start Logging

This command will configure the logging:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'sql'
    InstanceName = 'MyTask'
    SqlServer    = 'server.fqdn.com'
    Database     = 'LoggingDB'
    Table        = 'Logs'
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

Note: The logging provider will try to create database and table if needed.

> Logging with credentials

The previous example would use windows authentication as the current user.
If you want to use explicit credentials - SQL or Windows - offer them as a credential object:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'sql'
    InstanceName = 'MyTask'
    SqlServer    = 'Server = server.fqdn.com;'
    Database     = 'LoggingDB'
    Table        = 'Logs'
    Credential   = $cred
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

> Reusing an existing session

The following shows how you can reuse a custom session:

```powershell
$connection = Connect-DbaInstance -SqlInstance computername\instance # Add whatever other authentication and options
$paramSetPSFLoggingProvider = @{
    Name         = 'sql'
    InstanceName = 'MyTask'
    SqlServer    = $connection
    Database     = 'LoggingDB'
    Table        = 'Logs'
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

WARNING: It is not possible to use one session in parallel in different runspaces.
If you _also_ use the session in another runspace, concurrent use will cause errors, risking the loss of logs and failure of script!

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

For more detailed docs, [see the full documentation for the sql logging provider](../providers/sql.html)

> [Back to: Logging](../../logging.html)
