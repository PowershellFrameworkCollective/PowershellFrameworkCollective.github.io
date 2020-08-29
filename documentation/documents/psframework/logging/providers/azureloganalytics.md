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

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|WorkspaceId||WorkspaceId for the Azure Workspace we are logging our data objects to.|
|SharedKey||SharedId for the Azure Workspace we are logging our data objects to.|
|LogType|'Message'|Log type we will log information to.|

## Notes

This Logging Provider currently does not support special proxy handling.
In order to successfully log to Azure Log Analytics, default connectivity must succeed.

> [Back to: Logging](../../logging.html)
