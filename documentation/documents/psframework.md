---
title: PSFramework Documentation
---
# PSFramework Documentation

The module `PSFramework` provides an infrastructure to build modules and scripts on.
Whether it is message handling, logging, configuration, parameter classes, custom tab completion, scheduled powershell tasks or many more scripting specific challenges.

## Configuration
The configuration system offers the means to ...

 - Implement options for modules, similar to an application's options menu
 - Implement configuration of CI/CD pipelines
 - Control modules and scripts by group policy or DSC
 - utilize a cache that persists across powershell sessions

```powershell
Get-PSFConfig
Set-PSFConfig -Module MyModule -Name Path.ExportPath -Value "C:\export"
```

For more details on the configuration system, see the [dedicated component page](psframework/configuration.html).

## Tab Completion
Custom Tab Completion allows both developers and users to easily deploy custom tab completion.
Put an end to Mr. Typo and improve your everyday console experience!

 - Implement fast, reusable tab completion.
 - Add Tab Completion to own or existing commands.
 - Significantly improve tab completion.

For more details on the tab completion system, see the [dedicated component page](psframework/tab-completion.html).

## Parameter Classes
Parameter classes offer a more flexible way to accept user input.
Since they move input interpretation and validation into the parameter binding, function-code also becomes cleaner to read.

```powershell
[CmdletBinding()]
param (
    [PSFComputer]
    $ComputerName
)
```

For more details on the parameter classes component, see the [dedicated component page](psframework/parameter-classes.html)

## Validation Attributes

```powershell
[PSFValidateScript()]
[PSFValidatePattern()]
```

The validation attributes component offers new validation attributes that make parameter validation more convenient to use, as well as improving the end user experience with custom error messages.

For more details on the validation attributes component, see the [dedicated component page](psframework/validation-attributes.html)

## Utility

```powershell
Import-Csv .\files.csv | Select-PSFObject Name, 'FullName as Path', 'Length to long'
```

Utility is the catch-all category for individual commands that do not fit into any more specific category or would be a category ontu themselves.

For more details, see the individual pages on the [dedicated component page](psframework/utility.html)