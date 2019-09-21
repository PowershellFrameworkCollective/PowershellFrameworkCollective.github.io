---
title: validation-attributes: PsfValidateTrustedData
---
# PsfValidateTrustedData
## Synopsis

Describes how to use the `[PsfValidateTrustedData()]` validation attribute.

## Description

The `[PsfValidateTrustedData()]` validation attribute serves exactly the same purpose as the `[ValidateTrustedData()]` attribute: Ensuring that the input comes from a trusted source.

The original `[ValidateTrustedData()]` attribute was introduced in PowerShell v5.
This makes any code that uses it require at least that PowerShell version.
However often enough we still have to deal with older PowerShell versions, which is where `[PsfValidateTrustedData()]` comes in, enabling adding the protection in modules, that still need to support older PowerShell versions.

> WARNING: This attribute offers NO PROTECTION at older PowerShell versions! Its only purpose is to offer the same protection when used in PSv5 or newer, without preventing the code to run on PowerShell versions 3 or 4.

> Trusted Data: PowerShell considers all data to be trusted, so long as it was not stored in a variable defined in constrained language mode.

### Example

```powershell
[CmdletBinding()]
param (
    [PsfValidateTrustedData()]
    [object[]]
    $Property
)
```

Only when the command is called from a trusted source (such as a whitelisted module or anywhere on a system that does not enforce code integrity rules) will it accept input data for the `-Property` parameter.

## Notes

[Back to Validation Attributes](http://psframework.org/documentation/documents/psframework/validation-attributes.html)

| Version | 1.0 |
| Written on: | 2019-09-21 |
| Updated on: | 2019-09-21 |
