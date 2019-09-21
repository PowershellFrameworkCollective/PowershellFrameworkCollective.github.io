---
title: validation-attributes: PsfValidateSet
---
# PsfValidateSet

## Synopsis

Describes how to use the `[PsfValidateSet()]` validation attribute.

## Description

The `[PsfValidateSet()]` validation attribute can be used to validate input against a list of legal values. Its main use-case over `[ValidateSet()]` is the ability to dynamically calculate those values and to integrate into the `PSFramework` [Tab Completion Feature](https://psframework.org/documentation/documents/psframework/tab-completion.html).

> Note: In scenarios where you have a static list of legal values, [ValidateSet()] is the clearly superior choice! [PsfValidateSet()] alone does not provide any tab completion and must be combined with the PSFramework Tab Completion Feature, in order to provide it.

### Example

```powershell
[CmdletBinding()]
param (
    [PsfValidateSet(ScriptBlock = { (Get-ChildItem "C:\Users\").Name  })]
    [string]
    $Path
)
```

Ensures that input matches the values returned by the scriptblock (which will be the names of all profile folders).

```powershell
[CmdletBinding()]
param (
    [PsfValidateSet(TabCompletion = 'MyModule.UserProfiles')]
    [string]
    $Path
)
```

Uses the tab completion scriptblock registered under the name `'MyModule.UserProfiles'` in order to validate the input.
For more details, check out the `PSFramework` [Tab Completion Feature](https://psframework.org/documentation/documents/psframework/tab-completion.html).

Combining this validation attribute with the `PSFramework` [Tab Completion Feature](https://psframework.org/documentation/documents/psframework/tab-completion.html) enables combining dynamic tab completion with dynamic input validation, without having to resort to dynamic parameters.

### Properties

```text
Name:       ScriptBlock
Positional: False
Named:      True
```

The scriptblock to generate the list of legal values the input will be compared with.

```text
Name:       TabCompletion
Positional: False
Named:      True
```

The name of the tab completion scriptblock to also use for validation purposes.
Using this does _not_ confer the tab completion offered by the scriptblock - it must still be registered to command and parameter as defined in the `PSFramework` [Tab Completion Feature](https://psframework.org/documentation/documents/psframework/tab-completion.html).

```text
Name:       Values
Positional: False
Named:      True
```

A static list of legal values to compare the input with.
Included for completeness sake, but generally there should be no reason to use this over the plain old `[ValidateSet()]` attribute, if you already have a list of static values.

```text
Name:       ErrorMessage
Positional: False
Named:      True
```

The message to write when the input does _not_ equal any of the list of legal values. This text will be formatted using the default string formatter, inserting the original input into `{0}` and the legal values into `{1}` if present.

> Generally there should be no reason to override the default message of "Cannot accept {0}, specify any of the following values: '{1}'"

```text
Name:       ErrorString
Positional: False
Named:      True
```

The name of a localized string to use to write a localized error message when the input does _not_ equal any of the legal values. This text will be formatted using the default string formatter, inserting the original input into `{0}` and the legal values into `{1}` if present.

The name needs to be module-qualified.
For example `"MyModule.Validation.UserProfiles"` rather than just `"Validation.UserProfiles"` as would be the case on `Write-PSFMessage`.

> Generally there should be no reason to override the default message of "Cannot accept {0}, specify any of the following values: '{1}'", unless you need a localized version.

## Notes

[Back to Validation Attributes](https://psframework.org/documentation/documents/psframework/validation-attributes.html)

| Version | 1.0 |
| Written on: | 2019-09-21 |
| Updated on: | 2019-09-21 |
