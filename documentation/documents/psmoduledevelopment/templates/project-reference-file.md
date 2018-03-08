---
title: Templates: The Project Reference File
---
# Project Reference File
## Synopsis

When iterating on a project, it cn be tiring to have to manually set the meta information each time.

With the Project Reference File, you can place a file in your working folder for your project template and have it automatically detect settings.

## Description

### The File

The file must be named `PSMDTemplate.ps1` and must be located in the root folder / reference path.

### The content

The file must be a powershell script without syntax errors that returns a hashtable.

Example content:

```powershell
@{
	TemplateName = 'PSFProject'
	Version = "1.0.0.0"
	AutoIncrementVersion = $true
	Tags = 'module','psframework'
	Author = 'Friedrich Weinmann'
	Description = 'PowerShell Framework based project scaffold'
	Exclusions = @("PSMDInvoke.ps1") # Contains list of files - relative path to root - to ignore when building the template
	Scripts = @{
		guid = {
			[System.Guid]::NewGuid().ToString()
		}
		date = {
			Get-Date -Format "yyyy-MM-dd"
		}
		year = {
			Get-Date -Format "yyyy"
		}
		guid2 = {
			[System.Guid]::NewGuid().ToString().ToUpper()
		}
		guid3 = {
			[System.Guid]::NewGuid().ToString().ToUpper()
		}
		guid4 = {
			[System.Guid]::NewGuid().ToString().ToUpper()
		}
	}
}
```

As you can see, it has several properties of some interest:

| Name | Description |
| --- | --- |
| TemplateName | The name of the emitted template. Replaces the need to specify `-TemplateName` when calling `New-PSMDTemplate` |
| Version | The version number to set for the template. |
| AutoIncrementVersion | If the template already exists, and the specified version is lower than or equal to the current template, increment the latest version by 1 for the new template |
| Tags | This sets the Tags property on the template. Templates can be searched by tags, there is no other implicit functionality here. |
| Author | The author of this template |
| Description | Adds a description to the template |
| Exclusions | List of files - relative to the root - that will be ignored when building the template. |
| Scripts | List of registered, named scriptblocks. Those will be executed when invoking the template, their results will be available for insertion under their name. For more details on ScriptBlocks, see [The guide to working with scriptblocks](/working-with-scriptblocks.html) |

### Creating a project template that contains a reference file

Once the reference file is created, simply call it like this:

```powershell
New-PSMDTemplate -ReferencePath "C:\path\to\template\folder"
```

Since all the meta information was specified in the reference file, no further information is necessary. Note: The reference file itself is never part of the template itself.


## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |