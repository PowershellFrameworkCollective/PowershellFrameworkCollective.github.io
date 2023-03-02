---
title: Getting Started with Logging
---
# Getting Started with Logging

In order to create logs, all you need to do is update existing scripts and replace all instances of ...

```powershell
Write-Verbose
```

... with ...

```powershell
Write-PSFMessage
```

This is all that it takes, your scripts are now creating logfiles.

Note: Replacing custom functions such as the often used `Write-Log` works just the same - just send it the message and `Write-PSFMessage` will handle the rest.

# Example

```powershell
# Setting up the logging
$paramSetPSFLoggingProvider = @{
    Name         = 'logfile'
    InstanceName = '<taskname>'
    FilePath     = 'C:\Logs\TaskName-%Date%.csv'
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider

# Start Logging
Write-PSFMessage "Starting Script"

# Add script code here, using Write-PSFMessage wherever you want to log
# ...

Write-PSFMessage "Script Completed"

# Wait for logging to complete
Wait-PSFMessage
```

# Additional information

 - The logs are written to `Get-PSFConfigValue -FullName psframework.logging.filesystem.logpath | Invoke-Item`
 - The logs are written asynchronously, writing logs will not slow your script
 - You can use the `-Level` parameter to change the way the command behaves, shifting it to behavior like `Write-Host` or `Write-Warning` (and still log)
 - All logs are automatically cleaned up. By default, after 7 days or when they exceed 100MB
 - Using `Get-PSFMessage` you can grab/search entries directly while still on the console, avoiding the need to inspect the files.

# Further reading

- [Documentation root for the Logging System](https://psframework.org/documentation/documents/psframework/logging.html)
