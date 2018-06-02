---
title: Parameter Classes: TimeSpan Parameter Class
---
# TimeSpan Parameter Class
## Synopsis

The timespan parameter class is used to accept input that represents a timespan object.

## Description

The timespan parameter class is used to accept input that represents a timespan object.

One of the core weaknesses of the TimeSpan type as parameter type is that it's not really designed for input by the user.
Instead it's the system's way of tracking time differences - obviously a serious necessity.

However, this is not always convenient to type when manually providing input.
That's where the TimeSpan parameter class comes in, allowing time-relative shorthand string notations as timespan input!

## Example

```powershell
function Get-Test {
    [CmdletBinding()]
    param (
        [TimeSpan]
        $Difference
    )
    "$([TimeSPan]$Difference)"
}
```
would become
```powershell
function Get-Test {
    [CmdletBinding()]
    param (
        [PSFTimeSpan]
        $Difference
    )
    "$([TimeSPan]$Difference)"
}
```
With this, it now is possible to use time-relative strings as input:
```powershell
Get-Test -Difference "-2d"
```
Without impairing the ability to pass timespan objects:
```powershell
Get-Test -Difference (New-TimeSpan -Hours -48)
```

## Time-relative string syntax

There are few rules to respect with the string representing timespans*:

 - It only accepts strings where every element is legal (it will not ignore bad segments)
 - Any number of "-" characters will be stripped out of the string. Having at least one in the string will reverse the relative timestamp. The position of the "-" does not matter.
 - Each timestamp segment must be separated from the other segments by a whitespace.
 - Each timestamp segment starts with its numeric value and then - optionally - the letter(s) representing its unit. If no unit is specified, seconds are assumed.

Table of time unit letters:

| l | Represents |
| --- | --- |
| ms | Milliseconds |
| s | seconds |
| m | minutes |
| h | hours |
| d | days |

*For consistence reasons, this time-relative shorthand notation is identical to the one used in the DateTime parameter class.

### Syntax Examples

```powershell
# -2 days
Get-Test "-2d"

# negative 8 hours and 30 minutes
Get-Test "8h 30m"

# negative 16 minutes and 53
Get-Test "16m -53s"

# 523 Seconds
Get-Test 523
```

## Properties

The object as the function sees it has the following properties:

```
Name:        Value
Description: The resulting timespan.
Mandatory:   Yes (will always be present)
```
```
Name:        InputObject
Description: The original input object the user specified.
Mandatory:   Yes (will always be present)
```

## Supported Input Types

 - TimeSpan
 - String (Timerelative Syntax)
 - int (as seconds)

## Extending Support to new types

New supported types can be added at runtime by the user or by other modules as they are imported.

This allows having one module understand the output of commands from another, without the two being aware of each other.

Example on how to add a custom object as accepted input:

```powershell
$object = [PSCustomObject]@{
    PSTypeName = "Foo.Bar"
    TimeSpan   = "-2d 12h"
}
Register-PSFParameterClassMapping -ParameterClass TimeSpan -TypeName Foo.Bar -Properties TimeSpan
[PSFTimeSpan]$object
```

## Notes
[Back to Parameter Classes](http://psframework.org/documentation/documents/psframework/parameter-classes.html)

| Version | 1.0 |
| Written on: | 2018-04-16 |
| Updated on: | 2018-04-16 |