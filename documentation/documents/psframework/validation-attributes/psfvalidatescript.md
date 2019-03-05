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

```powershell
[CmdletBinding()]
param (
    [PSFValidateScript('MyModule.Script.TestDomainController', ErrorString = "MyModule.Validation.NotADomainController")]
    [string]
    $DomainController
)
```

This executes the scriptblock registered under the name `'MyModule.Script.TestDomainController'` (registered by using the command `Set-PSFScriptBlock`). If validation fails, it will then show the localized message registered under the name `'MyModule.Validation.NotADomainController'` (registered by using the command `Import-PSFLocalizedString`).

### Properties

```
Name:       ScriptBlock
Positional: True
Named:      False
```
The scriptblock to execute to validate the input object.

> Mutually exclusive with ScriptBlockName!

```
Name:       ScriptBlockName
Positional: True
Named:      False
```
The name of a scriptblock registered with `Set-PSFScriptblock`.
This allows the user to keep complex scriptblocks outside of the validation attribute itself, making the parameter block more neat.

> Mutually exclusive with ScriptBlock

```
Name:       ErrorMessage
Positional: False
Named:      True
```
The message to write when the scriptblock does _not_ return $true for the input. This text will be formatted using the default string formatter, inserting the original input into `{0}` and the scriptblock into `{1}` if present.

```
Name:       ErrorString
Positional: False
Named:      True
```

The name of a localized string to use to write a localized error message when the scriptblock does _not_ return $true for the input. This text will be formatted using the default string formatter, inserting the original input into `{0}` and the scriptblock into `{1}` if present.

The name needs to be module-qualified.
For example `"MyModule.Validation.PathNotExist"` rather than just `"Validation.PathNotExist"` as would be the case on `Write-PSFMessage`.

> Mutually exclusive with ErrorMessage

## Notes
[Back to Validation Attributes](https://psframework.org/documentation/documents/psframework/validation-attributes.html)

| Version | 1.1 |
| Written on: | 2018-04-14 |
| Updated on: | 2019-03-05 |