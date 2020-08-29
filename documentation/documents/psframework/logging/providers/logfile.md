# Logging Provider: Logfile

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to logfile](../loggingto/logfile.html)

## Description

The logfile Logging Provider enables writing to ... logfiles.
It can be flexibly tuned in what message-properties are written and what format they are written in.

It also offers logrotate capabilities, to clean up after itself.

## Stats

|Name|logfile|
|Version|2|
|ConfigurationRoot|PSFramework.Logging.LogFile|
|Supports Data|Partial|
|Installation|Not Required|

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|CsvDelimiter|,|The delimiter to use when writing to csv.|
|FilePath||The path to where the logfile is written. Supports some placeholders such as %Date% to allow for timestamp in the name.|
|FileType|CSV|In what format to write the logfile. Supported styles: CSV, XML, Html, Json or CMTrace. Html, XML and Json will be written as fragments.|
|Headers|'ComputerName', 'File', 'FunctionName', 'Level', 'Line', 'Message', 'ModuleName', 'Runspace', 'Tags', 'TargetObject', 'Timestamp', 'Type', 'Username'|The properties to export, in the order to select them.|
|IncludeHeader|True|Whether a written csv file will include headers|
|Logname||A special string you can use as a placeholder in the logfile path (by using '%logname%' as placeholder)|
|TimeFormat|`<current locale>`|The format used for timestamps in the logfile|
|Encoding|UTF8|In what encoding to write the logfile.|
|UTC|False|Whether the timestamp in the logfile should be converted to UTC|
|LogRotatePath||The path where to logrotate. Specifying this setting will cause the logging provider to also rotate older logfiles|
|LogRetentionTime|30 days|The minimum age for a logfile to be considered for deletion as part of logrotation|
|LogRotateFilter|*|A filter to apply to all files logrotated|
|LogRotateRecurse|False|Whether the logrotate aspect should recursively look for files to logrotate|

## Notes

### File Types

The logfile can be created in multiple different formats (and different instances of this Provider can use different formats).
The default format is CSV, but there is more ...

|Type|Description|
|---|---|
|CSV|The default format. A common CSV and the only type that respects the CsvDelimiter setting. Easy to open in Excel, making it a popular format for admins. However, as it is a flat table, this format cannot support the Data field.|
|Json|Writes entries as Json string. However, as each individual write cannot guarantee it being the last to write an entry to the file, all entries are written as _fragments_ . To turn the resulting file content into valid json, wrap it into square brackets.|
|XML|Writes entries as XML string. However, as each individual write cannot guarantee it being the last to write an entry to the file, all entries are written as _fragments_ . To turn the resulting file content into valid XML, wrap it into a `<Messages>` XML element.|
|Html|Writes entries as Html string. However, as each individual write cannot guarantee it being the last to write an entry to the file, all entries are written as _fragments_ . To turn the resulting file content into valid html, wrap it into a `<table>` html element.|
|CMTrace|Writes log entries in a format that can easily be consumed by the CMTrace log reading utility part of SCCM. This type ignores the selected headers to write and cannot support the Data field.|

### The Filepath insertion system

The FilePath setting - which requires the full path including the file - supports inserting values into it.
This allows you to specify placeholders which will be resolved at write-time.

Supported placeholders:

|Name|Value|
|---|---|
|%date%|Get-Date -Format 'yyyy-MM-dd'|
|%dayofweek%|(Get-Date).DayOfWeek|
|%day%|(Get-Date).Day|
|%hour%|(Get-Date).Hour|
|%minute%|(Get-Date).Minute|
|%username%|$env:USERNAME|
|%userdomain%|$env:USERDOMAIN|
|%computername%|$env:COMPUTERNAME|
|%processid%|$PID|
|%logname%|Setting: Logname|

These placeholders are designed, for when you use the configuration system to define logging, rather than `Set-PSFLoggingProvider` (where you could dynamically insert variables anyway).
If you define logging using the above-mentioned command, feel free to pick which ever option you prefer, placeholders or calculating the value directly.

> If the resolved path's folder does not exist yet, it will try to create it.

### The Data field

When using `Write-PSFMessage`, the command offers the ability to specify additional data in form of a hashtable passed to the `-Data` parameter.
Technically, this Logging Provider supports including this data for all formats that write structured data - Json, XML, Html.

However, it is _disabled_ by default!

To enable writing the Data field, update the Headers setting to include it.
Also note: There is no way to add a single value - you need to fully define all message fields you want to include in the log.
For example, this could look like this:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = 'MyTask'
    FilePath     = 'C:\Logs\TaskName-%Date%.json'
    FileType     = 'Json'
    Headers      = 'ComputerName', 'File', 'FunctionName', 'Level', 'Line', 'Message', 'ModuleName', 'Runspace', 'Tags', 'TargetObject', 'Timestamp', 'Type', 'Username', 'Data'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

### Logrotation

Using the `LogRotatePath` setting, you can enable logrotation for your logs.
Keep in mind, that these logs will only get rotated whenever the Logging Provider configured to rotate runs.
The path can use the same placeholders as the FilePath setting (see above), but need not point at specific files:
After resolving it it will be passed to Get-ChildItem, so pointing at the folder fully suffices, if you want all files in it to be subject to logrotation.

> Warning: This system has no idea which file was written how.
> It has no concept of "this logfile belongs to me".
> All files matched that meet the age requirement _will_ be deleted.

The other logrotation settings can further tune the behavior:

|Name|Comment|
|LogRetentionTime|Defaults to 30 days, any matched file older than this will be removed|
|LogRotateFilter|An additional filter to apply only to the filename|
|LogRotateRecurse|Whether the logrotate logic will search recursively under the pointed at folder|

The mechanism only deletes files, not folders.

For performance reasons, logrotation is limited to running once every 5 minutes during the end phase of the logging cycle.

> [Back to: Logging](../../logging.html)
