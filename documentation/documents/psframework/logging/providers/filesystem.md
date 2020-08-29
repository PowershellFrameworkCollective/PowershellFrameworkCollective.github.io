# Logging Provider: FileSystem

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to the debug log](../loggingto/debuglog.html)

## Description

The FileSystem Logging Provider is the enabled-by-default debug log generator.
It will write all messages to its output path - by default on Windows under AppData - and remove them after 7 days or 100 MB total folder size have been reached.

This log grants a history for debugging purposes without having to care about anything.

All messages from all tasks running under the user are logged to the same folder.
For a dedicated logfile for a given task, see the [logfile Provider](logfile.html) instead.

It will create csv files for the messages generated.
It will also create clixml exports of all error records that are logged.

## Stats

|Name|filesystem|
|Version|1|
|ConfigurationRoot|PSFramework.Logging.FileSystem|
|Supports Data|False|

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

### Operation

|Name|Default Value|Description|
|---|---|---|
|ModernLog|False|Enables the modern, more powereful version of the filesystem log, including headers and extra columns.|
|MessageLogFileEnabled|True|Governs, whether a log file for the system messages is written. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately.|
|ErrorLogFileEnabled|True|Governs, whether log files for errors are written. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately.|
|LogPath|`<misc>`|The path where the PSFramework writes all its logs and debugging information.|
|TimeFormat|`<currentlocale>`|The format used for timestamps in the logfile|
|TargetSerializationDepth|-1|Whether the target object should be stored as a serialized object. 0 or less will see it logged as string, 1 or greater will see it logged as compressed CLIXML.|

### Logrotate

|Name|Default Value|Description|
|---|---|---|
|MaxMessagefileBytes|5MB|The maximum size of a given logfile. When reaching this limit, the file will be abandoned and a new log created. Set to 0 to not limit the size. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately.|
|MaxMessagefileCount|5|The maximum number of logfiles maintained at a time. Exceeding this number will cause the oldest to be culled. Set to 0 to disable the limit. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately.|
|MaxErrorFileBytes|20MB|The maximum size all error files combined may have. When this number is exceeded, the oldest entry is culled. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately.|
|MaxTotalFolderSize|100MB|This is the upper limit of length all items in the log folder may have combined across all processes.|
|MaxLogFileAge|7 days|Any logfile older than this will automatically be cleansed. This setting is global.|

## Notes

### Modern Log

By default, the debug log does not actually contain headers in the csv file.
Historically, in the initial release, this was an oversight that wasn't considered back then.
By the time this was recognized as rather ... inconvenient, it had been out long enough to fall under the [PSFramework Reliability Promise](https://github.com/PowershellFrameworkCollective/psframework/blob/master/PSFramework/The%20PSFramework%20Reliability%20Promise.md).
This promise prevents breaking changes without a significant change process.
And even though there is a process, using it as sparingly as possible is policy, in order to maximize trust in the reliability of the PSFramework module.

Adding CSV headers afterwards _as a default_ was thus ruled out.
However, there is a configuration option that _enables_ the new format, adding missing columns and headers.

To enable it in the current process, run:

```powershell
Set-PSFConfig -Fullname 'PSFramework.Logging.FileSystem.ModernLog' -Value $true
```

To enable it for all PowerShell sessions on the current computer, run:

```powershell
# Requires running "As Admin", as it writes to HKLM:
Set-PSFConfig -Fullname 'PSFramework.Logging.FileSystem.ModernLog' -Value $true -PassThru | Register-PSFConfig -Scope SystemDefault
```

Want to roll this out by group policy for all computers?
Apply the following registry key per GPO:

```text
Key: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsPowerShell\PSFramework\Config\Default
Name: PSFramework.Logging.FileSystem.ModernLog
Type: REG_SZ
Value: Bool:true
```

### TargetSerializationDepth

This setting allows enabling target persistance as compressed Clixml string.
With that, the full PowerShell object is persisted in CSV, but utterly unreadable for the human eye.

In order to retrieve the data again, use the `ConvertFrom-PSFClixml` command:

```powershell
# Assuming Modern Log is enabled
Import-Csv .\computername_1234_message_1.log | ForEach-Object {
    if (-not $_.TargetObject) { return $_ }
    $_.TargetObject = $_.TargetObject | ConvertFrom-PSFClixml
    $_
}
```

> [Back to: Logging](../../logging.html)
