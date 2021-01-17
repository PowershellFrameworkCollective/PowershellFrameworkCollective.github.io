# Filtering by Runspace

> [Back to: Logging](../../logging.html)

## Description

The logging system allows for a wide variety of filtering options.
Whether you want to filter by level, tags, module or command ... the choice is yours.

All of these settings share a common trait however:
We only set them once and then rarely if ever change them.
However, there is one more thing that can be meaningfully filtered by that is a lot more changing:

Runspaces.

When working with large parallel workloads you may want to have a specific task logged to a specific [Logging Provider Instance](../basics/logging-providers.html).
With many runspaces coming and going - and runspace pools recycling old runspaces for use by new tasks - the traditional configuration system isn't up to the task.

## Preparing the Provider Instance

The first thing we need to set up is for your [Logging Provider Instance](../basics/logging-providers.html) to no longer accept anything unless it's blacklisted.
The easiest way to do so is setting the `RequiresInclude` setting to true.
That way, at least one include rule must match in order for a message to be accepted.

```powershell
$paramSetPSFLoggingProvider = @{
    Name            = 'logfile'
    InstanceName    = 'Task1'
    FilePath        = 'C:\Logs\Task1-%Date%.csv'
    RequiresInclude = $true
    Enabled         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

## Adding and Removing a runspace dynamically

To dynamically sign up to a [Logging Provider Instance](../basics/logging-providers.html) - or signing out as the case may be - there are two commands:

+ Add-PSFLoggingProviderRunspace
+ Remove-PSFLoggingProviderRunspace

To add your current runspace to the include list, run this line:

```powershell
Add-PSFLoggingProviderRunspace -ProviderName 'logfile' -InstanceName Task1
```

Analogously, you can just as easily remove your current runspace like this:

```powershell
Remove-PSFLoggingProviderRunspace -ProviderName 'logfile' -InstanceName Task1
```

## Notes

Two more pieces of information:

> The logging provider instance must already exist before calling `Add-PSFLoggingProviderRunspace`.

After setting up the logging provider instance using Set-PSFLoggingProvider, a short delay may occur before the instance is created.
With the default configuration, this delay should be no worse than 6 seconds and generally a lot less.
You can use the following line to check whether it has been created:

```powershell
Get-PSFLoggingProviderInstance -ProviderName logfile -Name Task1
```

> Point in Time logging

One aspect of the logging system is that it is asynchronous:
When [Writing a message](../basics/writing-messages.html) it queues the message for logging, but the decision on which logging provider processes it is made when it is finally processed.
This is of no concern when using the tools shown above!

When using `Add-PSFLoggingProviderRunspace` it stores a timestamp starting when messages will be accepted.
The same happens (the other way around) when using `Remove-PSFLoggingProviderRunspace`.

This means that even if a message is being logged after the Remove-command has been called, so long as it was written _before_ that point in time, it will still be accepted and logged with that [Logging Provider Instance](../basics/logging-providers.html).

> [Back to: Logging](../../logging.html)
