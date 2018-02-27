---
layout: post
title: New-PSFSupportPackage - Getting support and debugging information fast & comfortable
---

One of the latest additions to the PSFramework module, the function `New-PSFSupportPackage` enables the user to easily create a package of debugging information that can be used to troubleshoot issues the user might be having with a given powershell module / code.

# User experience

`New-PSFSupportPackage` is designed to be fairly easy to use for the user:

```powershell
New-PSFSupportPackage
```
This is all that is needed for it to get started and create a zip-file on the desktop, containing the information needed to troubleshoot the issue.

It will also tell the user just what it exported, as it might be easy to accidentally include confidential data.

# Working with the export

The zip archive includes a single xml file. Extract that file, then import it into PowerShell:

```powershell
$data = Import-Clixml "<path>\<to>\<file>.xml"
```

The object thus stored in `$data` contains all the information and contains the following properties:

## Execution Data

### ConsoleBuffer

Everything that is shown on the console screen and above it. Basically a screenshot of the entire PowerShell console.

### History

Input history of the user

### Messages

All messages logged to the PSFramework that are still available in memory.

Messages are written by `Write-PSFMessage`

### Errors

All errors logged to the PSFramework that are still available in memory.

Errors are logged by `Write-PSFMessage` and `Stop-PSFFunction`

### PSErrors

All errors stored in the `$Error` variable.

## Environment Information

### SnapIns

What PowerShell SnapIns were loaded

### Modules

What PowerShell modules were imported at the time of export.

Note: This includes the full script code in case of script modules!

### Assemblies

The DLL files imported into the process

### PSVersion

Information on the PowerShell version

### OperatingSystem

What Operating System the code was run on.

### Ram

Information on computer memory.

### CPU

Information on the computer's CPU

# Integration and supplement

PSFramework tries to support modules that contain their own debugging systems, by detecting their presence and if so will include their debugging data.

## dbatools

If the dbatools module is loaded, `New-PSFSupportPackage` will include their own debugging data by adding the following properties to the data package:

### DbatoolsMessages

All messages logged within dbatools that are still available in memory.

### DbatoolsErrors

All errors logged within dbatools that are still available in memory.