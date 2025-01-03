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
|Headers|'ComputerName', 'File', 'FunctionName', 'Level', 'Line', 'Message', 'ModuleName', 'Runspace', 'Tags', 'TargetObject', 'Timestamp', 'Type', 'Username'|The properties to export, in the order to select them. For writing the data field or renaming properties, see below under "Notes".|
|IncludeHeader|True|Whether a written csv file will include headers|
|Logname||A special string you can use as a placeholder in the logfile path (by using '%logname%' as placeholder)|
|TimeFormat|`<current locale>`|The format used for timestamps in the logfile|
|Encoding|UTF8|In what encoding to write the logfile.|
|UTC|False|Whether the timestamp in the logfile should be converted to UTC|
|LogRotatePath||The path where to logrotate. Specifying this setting will cause the logging provider to also rotate older logfiles|
|LogRetentionTime|30 days|The minimum age for a logfile to be considered for deletion as part of logrotation|
|LogRotateFilter|*|A filter to apply to all files logrotated|
|LogRotateRecurse|False|Whether the logrotate aspect should recursively look for files to logrotate|
|MutexName|''|Name of a mutex to use. Use this to handle parallel logging into the same file from multiple processes, by picking the same name in each process.|
|JsonCompress|$false|Will compress the json entries, condensing each entry into a single line.|
|JsonString|$false|Will convert all enumerated properties to string values when converting to json. This causes the level property to be 'Debug','Host', ... rather than 8,2,...|
|JsonNoComma|$false|Prevent adding commas between two json entries.|

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

### Renaming Columns or access Sub-Properties

The `Headers` setting supports not just a list of columns:
It also allows you to provide an expression to rename a column or access a sub-property.
This notably includes values in the `Data` property on the log message.

> Examples

```powershell
# Rename Level to Status
$headers = 'Timestamp', 'Level as Status', 'Message'

# Add the ticket number from the data section (where present)
$headers = 'Timestamp', 'Level', 'Message', 'Data.Ticket as TicketNr'

$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = 'MyTask'
    FilePath     = 'C:\Logs\TaskName-%Date%.csv'
    Headers      = $headers
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

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
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

> Data & CSV format

While some formats - such as Json or XML - can handle structured data, CSV is a flat table, which is the default format and the reason the `Data` property is not included by default.
There are however two useful ways to get that data into CSV logs:

+ Using a sub-property select statement (as shown in the previous section)
+ Using the `DataCompact` header.

The `DataCompact` header is a way to convert _all_ data entries into a string form (where present).
It is not ideal for later content processing, but it makes sure it all is in there at least.

Example:

```powershell
$headers = 'Timestamp', 'Level', 'Message', 'DataCompact'

$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = 'MyTask'
    FilePath     = 'C:\Logs\TaskName-%Date%.csv'
    Headers      = $headers
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

### Mutex: Writing to the same file from multiple processes

The PSFramework logging system has always been threadsafe.
In other words, logging in parallel from within the same process will never lead to write conflicts.
However if you want to write to the same file from multiple processes (for example when using PowerShell jobs), then there still is a problem.

Using something called Mutex it is possible to avoid that even across processes, so long as it is happening on the same computer.
This has been implemented in this logging provider.
To do so, all you need to do is specify a mutex name:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = 'MyMutexTask'
    FilePath     = 'C:\Logs\TaskName-%Date%.csv'
    MutexName    = 'PowerShellLogMyTask'
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

The specific name chosen for the mutex is not important and can be pretty much anything.
However, all processes trying to write to the same file need to use the same mutex name.

> Note: Using Mutexes is not a free action - there is a performance overhead involved.
> Only use it where you actually need to.

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
