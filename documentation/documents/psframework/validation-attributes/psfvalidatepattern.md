---
title: Validation Attributes: PSFValidatePattern
---

# Validation Attributes: PSFValidatePattern

## Synopsis

Describes how to use the `[PSFValidatePattern()]` validation attribute.

## Description

The `[PSFValidatePattern()]` can be used to parse input text based on a regular expression pattern.

It supports specifying regex options and custom error messages.

### Example

```powershell
[CmdletBinding()]
param (
    [PSFValidatePattern("^\w+$")]
    [string]
    $Name
)
```

This will compare the input text against the pattern `^\w+$` (which is true when the input is solely composed of letters and numbers of any kind, but not whitespace or special characters).

The error message will expect the user to understand the pattern.

```powershell
[CmdletBinding()]
param (
    [PSFValidatePattern("^\w+$", ErrorMessage = "Error procesing {0} - input must be a single word")]
    [string]
    $Name
)
```

This will compare the input text against the pattern `^\w+$` (which is true when the input is solely composed of letters and numbers of any kind, but not whitespace or special characters).

The error message will tell the user that it accepts only a single word and report the value that has been specified.

```powershell
[CmdletBinding()]
param (
    [PSFValidatePattern("^[A-Z]+$", ErrorMessage = "Error procesing {0} - input must only consist of the default 26 letters (A-Z), uppercase only", Options = "None")]
    [string]
    $Name
)
```

This will compare the input text against the pattern `^[A-Z]+$` with case sensitive matching (which is true when the input is solely composed of the 26 common English alphabet letters, all uppercase).

The error message will tell the user that it accepts only a single word of default, uppercase letters and report the value that has been specified.

### Properties

```text
Name:       RegexPattern
Positional: True
Named:      False
```

The regular expression to use to validate the input string. Run `Get-Help about_regular_expression` for more details on regex.

```text
Name:       ErrorMessage
Positional: False
Named:      True
```

Mutually exclusive with ErrorString.
The message to write when the pattern does _not_ match the input. This text will be formatted using the default string formatter, inserting the original input into `{0}` and the pattern into `{1}` if present.

```text
Name:       ErrorString
Positional: False
Named:      True
```

Mutually exclusive with ErrorMessage.
Customize the error message by providing a localization key for the error message.
In opposite to regular internationalized messages, localized exception messages will _not_ respect the logging language when being logged.
Specify the full, modulequalified message string, rather than using the usual shortened version used with `Write-PSFMessage`:

+ Used in validation attributes: `'MyModule.Validate.PathPattern'`
+ Used in `Write-PSFMessage`: `'MyCommand.Connected'` 

```text
Name:       Options
Positional: False
Named:      True
```

The regular expression options to use. All options listed in the `[System.Text.RegularExpressions.RegexOptions]` enumeration can be selected.

By default, it is set to IgnoreCase, making this attribute ignore all string casing. This can be overridden with `None`, in order to force case sensitivity.

## Notes
[Back to Validation Attributes](https://psframework.org/documentation/documents/psframework/validation-attributes.html)

| Version | 1.1 |
| Written on: | 2018-04-14 |
| Updated on: | 2019-09-21 |
