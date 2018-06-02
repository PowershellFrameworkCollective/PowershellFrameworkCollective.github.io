---
title: Parameter Classes: DateTime Parameter Class
---
# DateTime Parameter Class
## Synopsis

The datetime parameter class is used to accept input that represents a datetime object.

## Description

The datetime parameter class is used to accept input that represents a datetime object.

One of the core weaknesses of the DateTime type as parameter type is that it's not really designed for input by the user.
Instead it's the system's way of tracking timestamps - obviously a serious necessity.
However, in PowerShell, most user-input of timestamps is relative to the current time!
How often do you wonder "What were the logs betweem July, 4th and July, 11th?"?
How often do you wonder "What were the logs in the last 7 days?"?
Right.
That's where the DateTime parameter class comes in, allowing time-relative shorthand string notations as datetime input!

## Example

```powershell
function Get-Test {
    [CmdletBinding()]
    param (
        [DateTime]
        $Start
    )
    Get-Date $Start
}
```
would become
```powershell
function Get-Test {
    [CmdletBinding()]
    param (
        [PSFDateTime]
        $Start
    )
    Get-Date $Start
}
```
With this, it now is possible to use time-relative strings as input:
```powershell
Get-Test -Start "-2d"
```
Without impairing the ability to pass datetime objects:
```powershell
Get-Test -Start (Get-Date).AddDays(-2)
```

## Time-relative string syntax

There are few rules to respect with the string representing relative timestamps:

 - It only accepts strings where every element is legal (it will not ignore bad segments)
 - Any number of "-" characters will be stripped out of the string. Having at least one in the string will reverse the relative timestamp. The position of the "-" does not matter.
 - A leading "D" character (separated from the rest of the string by a whitespace) access the date of the resulting timestamp (enabling time-crops that are exactly on-date).
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

### Syntax Examples

```powershell
# Two days ago
Get-Test "-2d"

# In 8 hours and 30 minutes
Get-Test "8h 30m"

# The date it was 16 hours ago
Get-Test "D -16h"

# 16 minutes and 53 seconds ago
Get-Test "16m -53s"

# In 523 Seconds
Get-Test 523
```

## Properties

The object as the function sees it has the following properties:

```
Name:        Value
Description: The resulting timestamp.
Mandatory:   Yes (will always be present)
```
```
Name:        InputObject
Description: The original input object the user specified.
Mandatory:   Yes (will always be present)
```

## Supported Input Types

 - DateTime
 - String (Timerelative Syntax)
 - String (Timestamp current culture)
 - String (Timestamp invariant culture)
 - int (as seconds)

## Extending Support to new types

New supported types can be added at runtime by the user or by other modules as they are imported.

This allows having one module understand the output of commands from another, without the two being aware of each other.

Example on how to add a custom object as accepted input:

```powershell
$object = [PSCustomObject]@{
    PSTypeName = "Foo.Bar"
    Time       = "-2d 12h"
}
Register-PSFParameterClassMapping -ParameterClass DateTime -TypeName Foo.Bar -Properties Time
[PSFDateTime]$object
```

## Notes
[Back to Parameter Classes](https://psframework.org/documentation/documents/psframework/parameter-classes.html)

| Version | 1.0 |
| Written on: | 2018-04-16 |
| Updated on: | 2018-05-23 |