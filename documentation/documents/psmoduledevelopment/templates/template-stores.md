---
title: Templates: Template Stores
---
# Template Stores
## Synopsis

A 'Store' is a path where the templating system looks for templates.

## Description

### What are stores?

Stores allow the templating system to avoid having the user deal with the grizzly details of where information is stored _unless they want to_ . A store is a pointer at a path that should contain templates.

These stores are configured using the configuration system and are basically a name/path pair.

### What stores exist by default?

By default, two stores exist:

| name | path |
| --- | --- |
| default | "$env:APPDATA\WindowsPowerShell\PSModuleDevelopment\Templates" |
| psmoduledevelopment | "<moduleroot>\internal\templates" |

You can add more. And yes, as this scenario implies, modules can easily include their own stores with their own templates. (more details on that in the [Module included Templates](module-include-templates.html) article)

### How are stores stored

All configuration settings with a name like this: `psmoduledevelopment.template.store.*` are assumed to be stores.

The last name segment makes their name (so don't include a "." in the intended name).

```powershell
# List all stores
Get-PSFConfig psmoduledevelopment.template.store.*
```

### Changing the default path

You can update the path of any store, but most especially the `default` store (which really is your user store).

Simply update the setting using the configuration system:

```powershell
# Change path
Set-PSFConfig psmoduledevelopment.template.store.default "\\server\userhomes\myuser\templates"

# Make it remember across sessions
Register-PSFConfig -FullName psmoduledevelopment.template.store.default
```

### Creating new stores

It is totally possible - even useful - to create new stores. Your company might want global templates, you might have project specific templates as part of an Open Source Project's codebase and thus easily share them across the internet.

To create a new store, run this:

```powershell
Set-PSFConfig -Module 'PSModuleDevelopment' -Name 'Template.Store.MyStore' -Value "\\server\share\path\to\templates" -Initialize -Validation "string" -Description "Path to the project XYZ template store"
```

Notes:

 - This includes some fancy extras that make it safe to use in a module. For personal settings, `Module`, `Name` and `Value` are enough.
 - The `-Module` parameter must always point at `'PSModuleDevelopment'`, even if you use it in another module


## Notes
[Back to Templates](https://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |
