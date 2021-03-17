---
title: PSFramework Documentation
---
# PSFramework Documentation

The module `PSFramework` provides an infrastructure to build modules and scripts on.
Whether it is message handling, logging, configuration, parameter classes, custom tab completion, scheduled powershell tasks or many more scripting specific challenges.

## Logging

> The documentation of this component refers to v1.3.135, which is as of this writing still in prerelease/preview
> Some of this documentation may point at content not yet published to the gallery at all

The logging system provides powerful logging for little effort:

- Log to file, eventlog, SQL, Graylog, Splunk or Azure Log Analytics out-of-the-box
- Freely extensible for custom logging needs
- Runspace-Safe
- Asynchronous
- Log to multiple locations at the same time
- Logging can be defined in script, at the process level, by configuration per user or per computer. All without conflict.

For more details on the logging system, see the [dedicated component page](psframework/logging.html)

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

## Flow-Control
The Flow-Control component focuses on help govern how your code "flows".
This includes support for error handling, enhancing readability of your flow constructs (such as how you implement -WhatIf & -Confirm) and other utilities for governing your own code's layout.

+ Implement better user experience
+ Provide expert command flow features for less effort
+ Provide extension points for other modules
+ Improve readability of your code

For more details on the Flow-Control system, see the [dedicated component page](psframework/flow-control.html).

## Filters

The filter system in PSFramework allows developers to implement their own filter expression syntaxes.
This allows enabling users to define filter conditions in a user friendly manner.

+ Simple definition of condition logic
+ User-friendly authoring of filter expressions
+ Safe to use in data documents

For more details on the Filter system, see the [dedicated component page](psframework/filters.html).

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