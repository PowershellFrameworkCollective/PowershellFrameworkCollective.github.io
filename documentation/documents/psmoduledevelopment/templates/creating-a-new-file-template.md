---
title: Templates: Creating a new file template
---
# Creating a new file template
## Synopsis

Describes the ins and outs of how to create a file-based template.

## Description

### A simple function template

To start with, we could create a quick function template like this:

File is named `þnameþ.ps1`:
```powershell
function þnameþ
{
	[CmdletBinding()]
	Param (

	)

	begin
	{

	}
	process
	{

	}
	end
	{

	}
}
```
Then a quick:
```powershell
New-PSMDTemplate -FilePath ".\þnameþ.ps1" -TemplateName myFunction -Description "My first function template" -Author "<Insert your name here>" -Tags 'function','file'
```
And you've got a template named `myFunction` in your default [template store](template-store.html).

Easy enough to use, let's dig into the details:

### Parameters

In the previous example, we used `þnameþ`, which you probably assumed meant a template parameter that will be inserted when you create a file from this project. In which case you were 100% correct.

The template system picks up any parameter you insert during template creation and stores it in the parameter list it will prompt for. There is no need to have a central definition list of parameters.

Want to have a parameter called `Department`? Just insert `þDepartmentþ` where you want its content inserted, it will be detected, prompted for and inserted. Feel free to reuse the same parameter multiple times, there still will be only one prompt for it.

While theoretically, a parameter could be named almost anything - the only illegal characters are `{`, `}`, `!` and the parameter identifier (by default `þ`, but this can be changed), it is highly recommended to stick to regular letters.

Use descriptive names for the parameter, as that's all the info the user gets when prompted for it.

### Where shall the template go?

`New-PSMDTemplate` will by default write the new template to the default store for your session.

This is the path that is written in the `psmoduledevelopment.template.store.default` configuration setting.

```powershell
Get-PSFConfig -FullName psmoduledevelopment.template.store.default
```

You can specify any other store instead by using the `-OutStore` parameter.

Instead of writing to a template store, you can also just pick the path to write to, using `-OutPath` (Note: Point at the folder, do _not_ specify filename in this path).

```powershell
# To other store
New-PSMDTemplate -FilePath ".\þnameþ.ps1" -TemplateName myFunction -OutStore MyStore -Description "My first function template" -Author "<Insert your name here>" -Tags 'function','file'

# To Path
New-PSMDTemplate -FilePath ".\þnameþ.ps1" -TemplateName myFunction -OutPath "C:\temp" -Description "My first function template" -Author "<Insert your name here>" -Tags 'function','file'
```

### What can be templated?

The template system does not differentiate by file types.

You can template any file you want to. In order to be able to do meaningful parameter insertion, the file needs to be a plain-text file, however.

It _is_ possible to template a word document, but at this time, this module is incapable of doing text-insertions into those.

For some file types, the system _knows_ it cannot do content replacement. These are stored in the `psmoduledevelopment.template.binaryextensions` configuration setting and can be updated & amended as needed.

## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |
