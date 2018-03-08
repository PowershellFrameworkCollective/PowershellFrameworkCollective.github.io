---
title: Templates: Default Template Parameters
---
# Default Template Parameters
## Synopsis

This guide shows how to manage and create default parameters. Those will be inserted into template parameters unless otherwise specified.

## Description

When creating a file or project from a template, usually, the user is prompted for each parameter, unless he specifies a hashtable containing all those parameters.

There is however a way to set default input for any parameter. By default, settings for 'author' and 'company' exist.

All configuration settings that start with `psmoduledevelopment.template.parameterdefault.` contain default values. Let's take a look:

```powershell
Get-PSFConfig psmoduledevelopment.template.parameterdefault.*
```
```
    Module: psmoduledevelopment


FullName                                              Value     Description
--------                                              -----     -----------
psmoduledevelopment.template.parameterdefault.author  Friedrich The default value to set for the parameter 'Author'. This same setting can be created for any other parameter name.
psmoduledevelopment.template.parameterdefault.company MyCompany The default value to set for the parameter 'Company'. This same setting can be created for any other parameter name.
```

Now, odds are, your company name isn't `MyCompany`. If you want to change that setting, run this:

```powershell
Set-PSFConfig psmoduledevelopment.template.parameterdefault.company "ACME .inc"
```

Now, the setting has been changed (as another call to `Get-PSFConfig` will show you).

Want it to remember your company name beyond the current PowerShell Session? Run this after changing it:

```powershell
Register-PSFConfig -FullName psmoduledevelopment.template.parameterdefault.company
```

### Adding a new default parameter

Now let's assume you have templates that use a lot the `þdepartmentþ` parameter and you always need to insert your department.

This can be set by running these two lines (the first to set it, the second to make it remember it):

```powershell
Set-PSFConfig psmoduledevelopment.template.parameterdefault.department "Accounting"
Register-PSFConfig -FullName psmoduledevelopment.template.parameterdefault.department
```

And that's it! Now all your templates will default `þdepartmentþ` to `Accounting`

## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |