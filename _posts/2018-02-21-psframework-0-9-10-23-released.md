---
layout: post
title: PSFramework 0.9.10.23 released - Improving supportability
---

Today we released version 0.9.10.23 of the PSFramework module.

This latest release includes:

 - New Command: Unregister-PSFConfig - Allows removing registered settings from registry.
 - New command: New-PSFSupportPackage - Provides a simple way to wrap up an error report with comprehensive debugging information.
 - Updated Command: Write-PSFHostColor - New parameters `-NoNewLine` (In line with the same Write-Host parameter) and `-Level` (Allow suppressing messages depending on info message configuration)
 - Updated Command: Get-PSFTypeSerializationData - New parameter `-Fragment` allows skipping outer XML shell to add to existing type extension XML. Also cleaned up output.
 - Fixed Bug: Set-PSFConfig - Validation of array input would remove all but the first value.

# Unregister-PSFConfig

This command allows resetting configuration settings to their defaults by removing customizations from registry.
```powershell
Unregister-PSFConfig -Module dbachecks
```
This will purge all registered settings for the module `dbachecks`

# New-PSFSupportPackage

This command provides a simple way to wrap up an error report with comprehensive debugging information.

1) The user encounters an issue in his console and support isn't immediately available
2) The user runs `New-PSFSupportPackage` and sends the zip file that creates to the supporter.
3) The person doing support can now at his leisure work with a rich set of debugging information, not necessarily needing to look at the life scenario.

A few examples of what is packaged and available to the supporter:

 - Full input history
 - Full error history
 - Screenshot of console (clones the host buffer)
 - PowerShell Version
 - Loaded modules
 - Loaded libraries