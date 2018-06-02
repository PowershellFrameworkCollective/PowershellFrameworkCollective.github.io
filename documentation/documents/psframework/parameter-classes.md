---
title: PSFramework: Parameter Classes
---
# Parameter Classes
## Synopsis

Parameter Classes allow great flexibility and comfort for accepting input.

## Key Features

 - Bring Information, not Type
 - Highly intuitive user experience
 - Greater convenience in specifying input
 - Extensible to understand custom input

## Description

Parameter classes are C#-based data types, designed to be used as expected data type on parameters. For example:

```powershell
[CmdletBinding()]
param (
    [string]
    $ComputerName
)
```
would become
```powershell
[CmdletBinding()]
param (
    [PSFComputer]
    $ComputerName
)
```

This moves a lot of the input validation and all its interpretation into the parameter binding,
making it easier to use for developers than regular types. 
They generally also offer greater flexibility in accepting input and are often considered a great improvement over regular user input.

## Quick Start Guides

 - [Getting started with Parameter Classes](https://psframework.org/documentation/quickstart/psframework/parameter-classes.html)

## In depth Guides

 - [Computer Parameter Class](parameter-classes/computer-parameter.html)
 - [DateTime Parameter Class](parameter-classes/datetime-parameter.html)
 - [TimeSpan Parameter Class](parameter-classes/timespan-parameter.html)

## Notes
[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)

| Version | 1.0 |
| Written on: | 2018-04-16 |
| Updated on: | 2018-04-16 |