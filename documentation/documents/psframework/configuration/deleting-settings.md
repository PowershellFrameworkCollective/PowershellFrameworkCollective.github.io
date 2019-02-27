---
title: Configuration: Deleting Settings
---
# Deleting Settings
## Synopsis

Under some limited circumstances, it is possible to fully delete configuration settings.
This guide covers how and why.

## Description

### Introduction

Originally, the configuration system was designed as some kind of options menu for modules.
From that point of view, settings weren't deleted at runtime. Ever.
Instead, changes to the available settings would happen as a new version of the consuming module was released.

However, with the spread in other scenarios - especially within CI/CD processes - scenarios happen where full removal might be beneficial.
This system is designed to support just this, however ensures constraints are present to prevent harming the other envisioned scenarios.

The command used to delete configuration settings is colled:

```powershell
Remove-PSFConfig
```

### Limitations

Only settings that have been flagged as deletable can actually be deleted.
This flag can be set by using the `-AllowDelete` parameter on either `Set-PSFConfig` or `Import-PSFConfig`.

> Changing the setting on existing configuration items

Configuration items can be updated to be deletable using `Set-PSFConfig`. This however is *only* available until the setting has been [initialized](initialize.html).
The initialization call is the last time this setting can be applied.

> Policy Enforced Settings

Configuration settings that have been deployed by policy as an enforced value can under no circumstances whatsoever be deleted.
Ever.

### Deleting Configuration Items

The actual act of deleting a configuration item is a simple matter of:

```powershell
Remove-PSFConfig -FullName 'Phase1.Step1.Server'
```

> Note: PowerShell will prompt for confirmation before accepting to delete settings. Also specify '-Confirm:$false' to circumvent this prompt.

## Notes
[Back to Configuration](http://psframework.org/documentation/documents/PSFramework/configuration.html)

| Version | 1.0 |
| Written on: | 2019-02-27 |
| Updated on: | 2019-02-27 |