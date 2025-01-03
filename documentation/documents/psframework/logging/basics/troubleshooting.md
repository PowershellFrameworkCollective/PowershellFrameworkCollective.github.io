# Troubleshooting

> [Back to: Logging](../../logging.html)

## Synopsis

The logging in PSFramework is a complex beast, even though it is designed to be easy to set up and use.
This is perfectly fine so long as it works ... which it usually does.
Usually.

However, if something fails - whether it is a configuration error, backend or service issues or a bug in a Logging Provider (please report those) - then said complexity makes it quite hard to figure out what went wrong.
This guide is about finding out what is going on.

## Verify your configuration

As silly as it may sound, but often enough it's the simple things - a typo in your path, or forgetting to enable the logging.
These can be easy to miss and will quickly fail the logging.

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = 'Contoso-VMDeplyoment'
    FilePath     = 'C:\Logs\Contoso-VMDeployment-%Date%.csv'
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

or

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = 'Contoso-VMDeplyoment'
    FilePath     = 'C:\Lgs\Contoso-VMDeployment-%Date%.csv'
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

Both look sound on first look, neither will work.

> Configuration Driven Logging

In case you deployed the settings via some configuration settings - whether by policy, environment or `Register-PSFConfig` - there obviously is no `Set-PSFLoggingProvider` call to look at.
In that case, you can still check the settings via `Get-PSFConfig` though:

```powershell
# Figure out the current settings
Get-PSFConfig '*.Contoso-VMDeployment.*'

# What has been persisted on the machine.
# This should return the correct settings, if you have configured logging to the computer or user
Get-PSFConfig '*.Contoso-VMDeployment.*' -Registered
```

Note that the name here is the _InstanceName_ you defined in your configuration.
It is generally recommended providing one, to avoid conflicts with other logging settings.

## Verify the Server is configured right

Sometimes it's actually not PowerShell's fault.
It's hard to log to a SQL table, when the SQL Server does not accept SQL Connections, is down or your task user has no write access to the table.

## Logging the Logging

Now would it not be nice, if the logging system were to log its errors.
Problem here is of course, if the logging fails, how do we log that?

The answer to that is a special command:

```powershell
Get-PSFLoggingError
```

This will return all the errors that happened to the logging system in the current console for Logging Provider Instances that are enabled.
If it tried to log and that failed, his is where you get that message.

> The Logging Log and Scheduled Tasks

This command only works in the console where the logging error happened.
So ... what do we do when the issue only happens for a specific service account that is hard to act as?

Use `Export-PSFClixml` at the end of the task to write the errors to file:

```powershell
Get-PSFLoggingError | Export-PSFClixml -Path C:\temp\logging-error.clidat
```

Then you can load them in your interactive console to troubleshoot further:

```powershell
Import-PSFClixml -Path C:\temp\logging-error.clidat
```

## Check the logging system

The PSFramework logging happens in the background.
On import, we create a background runspace to handle all this logging ... and if for some reason it's turned off, no logging happens.

To check out its state, run:

```powershell
Get-PSFRunspace
```

For output like this:

```text
RunspaceGuid                           State Name
------------                           ----- ----
dda28d4c-0dd4-40df-8107-eb83b7130cd0 Running psframework.logging
                                     Stopped psframework.taskengine
```

If instead you get this:

```text
RunspaceGuid                           State Name
------------                           ----- ----
dda28d4c-0dd4-40df-8107-eb83b7130cd0 Stopped psframework.logging
                                     Stopped psframework.taskengine
```

Then something stopped the logging.
You can reenable it by running:

```powershell
Start-PSFRunspace -Name psframework.logging
```

> Logging and Azure Functions

There are some situations where having the logging runspace enabled by default can be an issue.
Azure Functions is a most notable case, where it would increase the cost of the function.
In cases like that, the logging is disabled by default (not started on module import) and an explicit `Start-PSFRunspace` call becomes necessary.

> [Back to: Logging](../../logging.html)
