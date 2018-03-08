---
title: Templates: Creating a new project template
---
# Creating a new project template
## Synopsis

Describes the ins and outs of how to create a project template.

## Description

### Notes

This article assumes you have read and understood the [post on creating a new file template](/creating-a-new-file-template.html).

### What is a project?

A project in the context of PSModuleDevelopment Templates is the content of a folder and all its children.

There is no 'quality' needed to become a project - all folders qualify, no exceptions.

By running `New-PSMDTemplate` with the `-ReferencePath` parameter pointed at a folder, it will automatically scan all folders and files in it and turn them _all_ into one template bundle.

For this it parses the parameters from all files and assembles one master list, removing duplicates.

```powershell
New-PSMDTemplate -ReferencePath F:\temp\MyModule -TemplateName MyModule -Description "Contains my module"
```

### What becomes part of my template?

All contents in the targeted reference folder are content, but not the folder itself.

 - It is possible to apply a filter by using the `-Filter` parameter (Which is passed through to `Get-ChildItem` when scanning the folder).
 - It is possible to explicitly specify a list of excluded files by their relative path to the reference path.

### Is there any way to simplify this further for templates I keep updating?

That sure is possible.

Using a [Project Reference File](/project-reference-file.html) you can predefine all of the meta information and other helpful functionalities.

Don't worry, the guide should cover it all as needed and it's fairly simple to use.


## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |