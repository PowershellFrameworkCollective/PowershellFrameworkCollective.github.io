# Logging to: Debuglog

## Setting up logging

The debug log is enabled by default, there is nothing that needs to be done to prepare for it.

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

The debuglog is written to two different locations:

- Memory
- A folder in AppData (logrotated after 7 days)

### Working with in-memory debug log

The in-memory log is especially valuable for live debugging, as it also shows messages that were not written to screen or generated in a background runspace.
To access it, simply run:

```powershell
Get-PSFMessage
```

Note: There are a lot more information pieces on a message than shown by default. Use `Get-PSFMessage | fl *` to see all there is to see.

> Limitations

By default, only the last 1028 messages are being retained in memory.


### Working with the file-based debug log

The debug log is also written to the current user's userprofile - into appdata.
At least by default, this can be changed using the [PSFramework Configuration System](../../configuration.html).

To find the current location, run the following line:

```powershell
Get-PSFConfigValue -FullName PSFramework.Logging.FileSystem.LogPath
```

In that folder you can find two different kinds of files:

- *.log files
- *.xml files

The .log files are actually CSV files, containing the message data.
The .xml files are any error records that were logged (e.g. when using `Stop-PSFFunction`).
You can use `Import-PSFClixml` to access the content, allowing you to inspect the original error that happened.

> Limitations

This folder is subject to automatic logrotation, to prevent any impact to the system.
Default limits:

- All files: 7 Days old
- A maximum of 100MB data combined throughout the whole folder
- A maximum of 5 .log files per process
- A maximum of 5MB per .log file of the current process
- A maximum of 25MB of .xml files total

> Modern Log

The system has evolved a lot over time.
Some previous decisions were ... less than optimal.
Due to the [PSFramework Reliability Promise](https://github.com/PowershellFrameworkCollective/psframework/blob/master/PSFramework/The%20PSFramework%20Reliability%20Promise.md) however we are prevented from just breaking them.

Issue:

> The .log files do not contain CSV headers and are missing some of the newer properties on a message object.

To solve this, the `ModernLog` configuration option was added, enabling you to enable csv headers and the missing columns:

```powershell
# For current process only
Set-PSFConfig -FullName PSFramework.Logging.FileSystem.ModernLog -Value $true

# Permanently for all users on this computer
Set-PSFConfig -FullName PSFramework.Logging.FileSystem.ModernLog -Value $true -PassThru | Register-PSFConfig -Scope SystemDefault
```

## Configuring the Debug Log

Using the [PSFramework Configuration System](../../configuration.html) you can change how exactly the debug logging works, as well as its limitations.

Using `Set-PSFConfig` and/or `Register-PSFConfig` or the other tools open to govern configuration, you can define the following settings:

> In-Memory Log

| Setting | Default Value | Description |
|###|###|###|
| PSFramework.Logging.MaxErrorCount | 128 | The maximum number of error records maintained in-memory. |
| PSFramework.Logging.MaxMessageCount | 1024 | The maximum number of messages that can be maintained in the in-memory message queue. |
| PSFramework.Logging.MessageLogEnabled | True | Governs, whether a log of recent messages is kept in memory. |
| PSFramework.Logging.ErrorLogEnabled | True | Governs, whether a log of recent errors is kept in memory. |

> File-based log

| Setting | Default Value | Description |
|###|###|###|
| PSFramework.Logging.FileSystem.ErrorLogFileEnabled | True | Governs, whether log files for errors are written. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately. |
| PSFramework.Logging.FileSystem.LogPath | C:\Users\frweinma\AppData\Roaming\WindowsPowerShell\PSFramework\Logs | The path where the PSFramework writes all its logs and debugging information. |
| PSFramework.Logging.FileSystem.MaxErrorFileBytes | 20MB | The maximum size all error files combined may have. When this number is exceeded, the oldest entry is culled. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately. |
| PSFramework.Logging.FileSystem.MaxLogFileAge | 7.00:00:00 | Any logfile older than this will automatically be cleansed. This setting is global. |
| PSFramework.Logging.FileSystem.MaxMessagefileBytes | 5MB | The maximum size of a given logfile. When reaching this limit, the file will be abandoned and a new log created. Set to 0 to not limit the size. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately. |
| PSFramework.Logging.FileSystem.MaxMessagefileCount | 5 | The maximum number of logfiles maintained at a time. Exceeding this number will cause the oldest to be culled. Set to 0 to disable the limit. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately. |
| PSFramework.Logging.FileSystem.MaxTotalFolderSize | 100MB | This is the upper limit of length all items in the log folder may have combined across all processes. |
| PSFramework.Logging.FileSystem.MessageLogFileEnabled | True | Governs, whether a log file for the system messages is written. This setting is on a per-Process basis. Runspaces share, jobs or other consoles counted separately. |
| PSFramework.Logging.FileSystem.ModernLog | True | Enables the modern, more powereful version of the filesystem log, including headers and extra columns |
| PSFramework.Logging.FileSystem.TargetSerializationDepth | -1 | Whether the target object should be stored as a serialized object. 0 or less will see it logged as string, 1 or greater will see it logged as compressed CLIXML. |
| PSFramework.Logging.FileSystem.TimeFormat | yyyy-MM-dd HH:mm:ss | The format used for timestamps in the logfile |

## Logging Provider Documentation

For more detailed docs, [see the full documentation for the FileSystem logging provider](../providers/filesystem.html)

> Note: Technically, the in-memory log is part of the message system and not a dedicated logging provider, hence the docs in this link only cover the file-based portions.
