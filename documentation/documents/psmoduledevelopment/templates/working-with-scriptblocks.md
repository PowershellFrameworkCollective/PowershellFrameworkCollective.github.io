---
title: Templates: Working with ScriptBlocks
---
# Templates: Working with ScriptBlocks
## Synopsis

The templating system supports running scriptblocks at invocation time and inserting their results into created documents.

## Description

There are two kinds of scriptblocks in the templating system:

 - Registered Scriptblocks: Those are defined in the [Project Reference File](project-reference-file.html)
 - Dynamic Scriptblock: Those are defined within the documents to be templated

In the processing stage, both are processed in the same manner, registered scriptblocks however are easier to manage and read within the template.

Since there is no [Project Reference File](project-reference-file.html) in file templates, those can only utilize dynamic scriptblocks.

### Registered Scriptblock

A registered Scriptblock is defined in the [Project Reference File](project-reference-file.html) and referenced in any template file as desired.

Example Reference File:
```powershell
@{
	TemplateName = 'module'
	Version = "1.0.0.0"
	AutoIncrementVersion = $true
	Tags = 'module'
	Author = 'Friedrich Weinmann'
	Description = 'basic module scaffold'
	Exclusions = @("PSMDInvoke.ps1") # Contains list of files - relative path to root - to ignore when building the template
	Scripts = @{
		guid = {
			[System.Guid]::NewGuid().ToString()
		}
	}
}
```

Ignoring the template metadata, this registeres one scriptblock named `guid` that when run will generate a guid string.

To use a registered scriptblock, reference to it like this:

```
þ!guid!þ
```

The name enclosed by the identifier on the outside and exclamation marks on the inside.

The beginning of a powershell module's psd1 file might thus look like this:

```
@{
	# Script module or binary module file associated with this manifest
	ModuleToProcess = 'þnameþ.psm1'

	# Version number of this module.
	ModuleVersion = '1.0.0.0'

	# ID used to uniquely identify this module
	GUID = 'þ!guid!þ'

	# Author of this module
	Author = 'þauthorþ'
```

*Important note:*

Each scriptblock is only executed exactly once on template invocation! The result is saved and then pasted inside.

If you need to run the same scriptblock multiple times - for example to create multiple guids - you need to define additional scriptblocks with different names!

### Dynamic Scriptblocks

A dynamic scriptblock is embedded as it is into the template files where needed. The begining of a powershell module's psd1 file might thus look like this:

```
@{
	# Script module or binary module file associated with this manifest
	ModuleToProcess = 'þnameþ.psm1'

	# Version number of this module.
	ModuleVersion = '1.0.0.0'

	# ID used to uniquely identify this module
	GUID = 'þ{ [System.Guid]::NewGuid().ToString() }þ'

	# Author of this module
	Author = 'þauthorþ'
```

This scriptblock will be parsed out during template creation and replaced with an automatic name, the scriptblock assigned to the template file in a similar manner to a registered scriptblock.

*Important note:*

Dynamic scriptblocks are combined with other dynamic scriptblocks that have an identical signature.

If for example you need to run `þ{ [System.Guid]::NewGuid().ToString() }þ` multiple times, be sure to vary its signature, for example by appending a number of comment symbols.

### Scriptblock validation

Scriptblocks are _not_ validated by the template system in any way.

*Do not use* templates from untrusted sources without inspecting them first yourself, by using the `-Raw` parameter:

```powershell
Invoke-PSMDTemplate someTemplate -Raw
```

This writes the template to file/folder without performing any inserts and without executing scriptblocks.

All scriptblocks - including dynamic ones - will be part of the abstracted Project Reference File (if a project template) or a scriptblock meta-file (if a file template), and can be inspected in a central location.

## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |
