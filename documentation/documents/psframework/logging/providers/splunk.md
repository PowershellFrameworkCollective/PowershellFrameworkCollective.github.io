# Logging Provider: Splunk

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to NAME](../loggingto/splunk.html)

## Description

Logs messages to Splunk SIEM servers.
Supports logging to both the on-prem installation and the cloud service.

## Stats

|Name|splunk|
|Version|2|
|ConfigurationRoot|PSFramework.Logging.Splunk|
|Supports Data|True|
|Installation|Not Required|

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|Url||The url to the Splunk http event collector. Example: https://localhost:8088/services/collector|
|Token||The token used to authenticate to the Splunk event collector.|
|Properties|'Timestamp', 'Message', 'Level', 'Tags', 'FunctionName', 'ModuleName', 'Runspace', 'Username', 'ComputerName', 'TargetObject', 'Data'|The message properties to write to Splunk.|
|LogName|Undefined|Name associated with the task. Included in each entry, making it easier to reuse the same http event collector for multiple tasks.|
|IgnoreCert|False|Whether the server certificate should be validated or not.|


## Notes

### Enabling receiving events from PowerShell on the Splunk end

Splunk does not automatically listen for data from PowerShell.
To enable receiving logs, you first need to configure this configurable service correctly.

The Logging Provider tries to push data to a http listener on Splunk. For example, [this guide](https://ntsystems.it/post/sending-events-to-splunks-http-event-collector-with-powershell) shows how to set that up.

### Splunk Cloud service

Logging to the cloud version of Splunk works exactly the same way as on-prem - configure the listener, then register it with the hostname of your cloud instance: `'https://instance-hostname:8088/services/collector'`

> [Back to: Logging](../../logging.html)
