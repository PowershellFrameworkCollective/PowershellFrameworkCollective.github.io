---
title: Templates: Template Versions
---
# Template Versions
## Synopsis

Templates can have versions, but what do they do?

## Description

### The effect of versions

Versions allow having multiple, well ... versions, of the same template available at the same time.

There can only be one copy of a given template at a given version in a given store.

### Listing all versions of a template

By default, `Get-PSMDTemplate` only shows the latest version found.To instead list all versions of all templates use the -All switch.

```powershell
Get-PSMDTEmplate -All
```

### Selecting by version

Get-PSMDTemplate has two additional parameters that target version:

 - `-MinimumVersion` - Only templates with at least that version will be returned (the latest only unless `-All` was also specified)
 - `-RequiredVersion` - Only the specified version will be returned.

### Invoking a specific version of a template

It is possible to invoke a specific template from a specific store at a specific version by using `Get-PSMDTEmplate` to select it and piping the result to `Invoke-PSMDTemplate`.

```powershell
Get-PSMDTemplate -TemplateName function -RequiredVersion "1.0.0.0" | Invoke-PSMDTemplate
```

### Cleaning up deprecated versions

`Remove-PSMDTemplate` can be used to delete templates.

It has a special parameter dealing with outdated templates: `-Deprecated`

If this is specified, only templates that _are not_ of the latest version will be removed:

```powershell
Remove-PSMDTemplate -TemplateName function -Deprecated
```

## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |
