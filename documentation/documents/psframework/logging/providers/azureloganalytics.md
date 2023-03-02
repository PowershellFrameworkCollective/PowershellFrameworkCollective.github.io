# Logging Provider: Azure Log Analytics

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to Azure Log Analytics](../loggingto/azureloganalytics.html)

## Description

A Logging Provider that enables to user to send messages straight to an Azure Log Analytics workspace.
Requires you to have already configured a target workspace to log to.

## Stats

|Name|AzureLogAnalytics|
|Version|2|
|ConfigurationRoot|PSFramework.Logging.AzureLogAnalytics|
|Supports Data|False|
|Installation|Not Required|

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|WorkspaceId||WorkspaceId for the Azure Workspace we are logging our data objects to.|
|SharedKey||SharedId for the Azure Workspace we are logging our data objects to.|
|LogType|'Message'|Log type we will log information to.|

## Log Analytics and Azure Functions

If you are trying to log using PSFramework while inside an Azure Function App, there is one additional catch:
By default, logging is disabled in Function Apps, as it might keep the Function App running after the main script is done, creating unexpected overhead (and thus costs).

To enable it, run:

```powershell
Start-PSFRunspace -Name psframework.logging
```

When your code is done, be sure to disable it again avoid aforementioned costs:

```powershell
# Wait for logging to complete
Wait-PSFMessage

# Stop logging runspace
Stop-PSFRunspace -Name psframework.logging
```

## Notes

This Logging Provider currently does not support special proxy handling.
In order to successfully log to Azure Log Analytics, default connectivity must succeed.

> [Back to: Logging](../../logging.html)
