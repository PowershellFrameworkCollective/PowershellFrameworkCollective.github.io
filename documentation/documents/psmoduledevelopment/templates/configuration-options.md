---
title: Templates: Configuration Options
---
# Configuration Options for the Template System
## Synopsis

Describes the configuration options available to Template users

## Description

Like many other components of the `PSFramework` project's modules, the template system depends on the configuration system.

To detect all settings, run this:

```powershell
Get-PSFConfig PSModuleDevelopment.template.*
```
```
    Module: psmoduledevelopment


FullName                                               Value                Description
--------                                               -----                -----------
psmoduledevelopment.template.binaryextensions          System.Object[]      When creating a template, files...
psmoduledevelopment.template.identifier                þ                    The identifier used by the temp...
psmoduledevelopment.template.outpath                   .                    The path where new files & proj...
psmoduledevelopment.template.parameterdefault.author   Friedrich            The default value to set for th...
psmoduledevelopment.template.parameterdefault.company  MyCompany            The default value to set for th...
psmoduledevelopment.template.store.default             C:\Users\Friedric... Path to the default directory w...
psmoduledevelopment.template.store.psmoduledevelopment C:\Program Files\... Path to the templates shipped i...
```

### Binary Extensions
```
Name:    psmoduledevelopment.template.binaryextensions
Default: '.dll', '.exe', '.pdf', '.doc', '.docx', '.xls', '.xlsx'
```
Files it knows not to try to parse. When creating templates, files with these extensions will be included as raw bytes, no parameter replacements will be performed.

This configuration setting has only effect when _creating_ a template, not when generating files or projects from it (as at that point the decision on how to process these files has already been made).

### Identifier
```
Name:    psmoduledevelopment.template.identifier
Default: þ
```
The identifier is the character/string used by the template system to detect and insert variables / scriptblocks.

This configuration setting has only effect when _creating_ a template, not when generating files or projects from it (as at that point the decision on how to process these files has already been made).

The identifier can be a single character or a multi-character string. The identifier sequence may not occur in templated documents except as a way to identify variables and scriptblocks to insert into it.

### Outpath
```
Name:    psmoduledevelopment.template.outpath
Default: .
```
When generating a file or project, this is the default path where the generated file or project is created.

The default `.` implies the current directory, but any legal path is supported.

### Default Parameter
```
Name:    psmoduledevelopment.template.parameterdefault.*
Default: author = $env:USERNAME
Default: company = "MyCompany"
```
When generating a file / project from a template, that template may contain parameters/variables to insert into the files created.

When no parameter is specified as part of the function call, then ...

 - It will first look for [default parameters](default-template-parameters.html) for the same name and insert those
 - It will then prompt the user for any missing parameters

It is thus possible to avoid having to retype the same information again and again.

Users can freely create new default parameters, simply by creating new settings following the same naming pattern.

### Template Stores
```
Name:    psmoduledevelopment.template.store.*
Default: default = "$env:APPDATA\WindowsPowerShell\PSModuleDevelopment\Templates"
Default: PSModuleDevelopment = "<moduleroot>\internal\templates"
```
[Template Stores](template-stores.html) are paths in which template files are stored.

It is possible to add any number of them, allowing the user to easily share templates with team mates or include project specific templates in the project source and still access them as easily as other templates.

### Changing Settings

These settings can be changed, by using the `Set-PSFConfig` command. Example:

```powershell
Set-PSFConfig psmoduledevelopment.template.identifier '||'
```

Creating new settings (e.g. to add stores or default parameters) works exactly the same way.

### Persisting Settings

After having applied changes to some of these settings, you may wish to make sure those settings persist across more than the current powershell session.

There are two ways to do this:

 - Add a `Set-PSFConfig` call to your profile. This will automatically import the `PSFramework` module whenever you start PowerShell
 - After changing those settings once, call `Register-PSFConfig` to store the settings.

Example for using `Register-PSFConfig`:
```powershell
Register-PSFConfig -FullName psmoduledevelopment.template.identifier
```

## Notes
[Back to Templates](https://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-10 |
| Updated on: | 2018-03-10 |