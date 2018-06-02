---
title: Validation Attributes: PSFValidateScript
---
# Validation Attributes: PSFValidateScript
## Synopsis

Describes how to use the `[PSFValidateScript()]` validation attribute.

## Description

The `[PSFValidateScript()]` can be used to run a test script against any input object. If the return value of that scriptblock is `$true`, the validation is successful.

The error message can be custom tailored in order to be more user friendly.

Note: Validation attributes will be executed _after_ type coercion. So expect to work with the expected input type.

### Example
```powershell
[CmdletBinding()]
param (
    [PSFValidateScript({ Test-Path $_ })]
    [string]
    $Path
)
```
This will validate the input object as an existing path.

The error message will expect the user to understand the scriptblock.

```powershell
[CmdletBinding()]
param (
    [PSFValidateScript({ Test-Path $_ }, ErrorMessage = "Error procesing {0} - the path must exist")]
    [string]
    $Path
)
```
This will validate the input object as an existing path.

The error message will tell the user that it accepts only a existing paths and report the value that has been specified.
### Properties

```
Name:       ScriptBlock
Positional: True
Named:      False
```
The scriptblock to execute to validate the input object.

```
Name:       ErrorMessage
Positional: False
Named:      True
```
The message to write when the pattern does _not_ match the input. This text will be formatted using the default string formatter, inserting the original input into `{0}` and the pattern into `{1}` if present.

## Notes
[Back to Validation Attributes](https://psframework.org/documentation/documents/psframework/validation-attributes.html)

| Version | 1.0 |
| Written on: | 2018-04-14 |
| Updated on: | 2018-04-14 |