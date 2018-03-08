---
title: Templates: Overwriting default Templates
---
# Overwriting default Templates
## Synopsis

The module ships with default templates, other modules may do the same. But what if they use a name you want for your own template?

## Description

You can use `Get-PSMDTemplate` to get a list of all templates on your system. It will always only list the latest version of a given template name.

`Invoke-PSMDTemplate` uses `Get-PSMDTemplate` to select what template to create when specifying the name.

Thus you can override an existing template by creating a template of your own, with the same name but with a higher version number.

See the guide on [Template Versions](/template-versions.html) on how to handle versions.

## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |