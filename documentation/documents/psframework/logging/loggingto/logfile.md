> [Back to: Logging](../../logging.html)

## Setting up logging

To enable logging to a dedicated logfile, in its simple-most format, run the following command:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = '<taskname>'
    FilePath     = 'C:\Logs\TaskName-%Date%.csv'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

The file produced will be a csv file with headers included.

> Switching to format to CMTrace

The logfile provider can write logs in multiple formats, including the format preferred by the SCCM log reading application CMTrace.
To configure it to log in that format, execute the following instead:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = '<taskname>'
    FilePath     = 'C:\Logs\TaskName-%Date%.log'
    FileType     = 'CMTrace'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

> Logrotate

Want to include logrotation?

```powershell
$paramSetPSFLoggingProvider = @{
    Name          = 'logfile'
    InstanceName  = '<taskname>'
    FilePath      = 'C:\Logs\TaskName-%Date%.csv'
    Enabled       = $true
    LogRotatePath = 'C:\Logs\TaskName-*.csv'
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

This will delete all logs older than 30 days.

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

## Using the log

The logfile provider has a great many options to tune its actual behavior.
Key Highlights:

### File Format

The file format is defined through the `FileType` parameter / settings.

| Format | Description |
|---|---|
| CSV | (default) output in CSV format, delimiter can be chosen |
| XML | Output as an XML fragment. Slight post-processing needed, adding wrapping elements. |
| Html | Output as a Html fragment. Slight post-processing needed, adding wrapping table elements. |
| Json | Output as a Json fragment. Slight post-processing needed. |
| CMTrace | Output in the CMTrace format, ignores the property selection. |

### Timestamp

There are two parameters / settings governing timestamps:

+ TimeFormat: A format string to use on the timestamp
+ UTC: Whether the timestamp should be written in UTC, rather than localtime

### FilePath

The path to where the file will be created.
This path supports placeholders that will be autoamtically resolved:

| Placeholder | Value |
|---|---|
| %date% | The current date in a yyyy-MM-dd format |
| %dayofweek% | The current day of the week (Monday, Tuesday, ...) |
| %day% | The current day of the month |
| %hour% | The current hour of the day |
| %minute% | The current minute of the hour |
| %username% | The name of the current user, picked from environment variables. |
| %userdomain% | The domain of the user, picked from environment variables. |
| %computername% | The name of the current computer, picked from environment variables. |
| %processid% | ID of the current process |
| %logname% | The value of the `logname` setting/parameter. |

Now you may wonder, why offer those inserts, when you could just insert the variables when calling `Set-PSFLoggingProvider`.
Two reasons:

- These are interpreted at runtime on each logging cycle. This can be used to split up the log on long-running tasks.
- It is possible to deploy these settings, such as FilePath, via [the Configuration Component](../../configuration.html), which cannot actually do live variable insertion.

The logging provider will create the folder in which to create files if needed and able to.

### Headers

This setting/parameter defines which property of the message to log (and in which order).
It is ignored in CMTrace File Format, but all other formats support it.

You can check the available properties from any message object:

```powershell
Write-PSFMessage -Message 'Some text'
Get-PSFMessage | Select-Object -Last 1 | fl *
```

### Log Rotation

This provider includes the ability to automatically rotate stale logfiles.

This is governed by four different settings/parameters:

| Setting | Default Value | Description |
|---|---|---|
| LogRotatePath | '' | The path where to logrotate. Specifying this setting will cause the logging provider to also rotate older logfiles |
| LogRetentionTime | 30d | The minimum age for a logfile to be considered for deletion as part of logrotation |
| LogRotateFilter | * | A filter to apply to all files logrotated |
| LogRotateRecurse | $false | Whether the logrotate aspect should recursively look for files to logrotate |

This means logrotate is disabled by default, specifying any path will enable it.
One thing to note however: Logrotation only happens when PowerShell runs this configured profile.
If this is defined in a task that runs once per month, logrotate is also only executed once per month.

Technically, nothing prevents you from using this to rotate logs other than the ones created through this provider.

## Logging Provider Documentation

For more detailed docs, [see the full documentation for the logfile logging provider](../providers/logfile.html)

> [Back to: Logging](../../logging.html)
