---
title: Parameter Classes: Computer Parameter Class
---
# Computer Parameter Class
## Synopsis

The computer parameter class is used to accept input that points at a computer.

## Description

The computer parameter class is used to accept input that points at a computer.

Out of the box it supports a wide range of objects identifying a computer (including specifically the output of `Get-ADComputer`).
These can be expanded upon, allowing even to accept named PSCustomObject items.

## Example

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
Within the function, no changes are necessary, unless string methods on the object are used. The command now understands PSSession objects, ADComputers, DNS resolution objects, ...

## Properties

The object as the function sees it has the following properties:

```
Name:        ComputerName
Description: The name of the host to use. Effectively the interpreted value of the input specified.
Mandatory:   Yes (will always be present)
```
```
Name:        IsLocalhost
Description: Whether the computer points at the local machine.
Mandatory:   Yes (will always be present)
```
```
Name:        Type
Description: What type of item was provided. Will be `Default` unless specific connection objects (CimSessions, PSSessions or SMO Server Objects) were specified.
Mandatory:   Yes (will always be present)
```
```
Name:        InputObject
Description: The original input object the user specified. Allows reusing session objects.
Mandatory:   Yes (will always be present)
```

## Supported Input Types

 - string
 - DNS Name
 - SQL Instance names
 - PSSession objects
 - SQL Connection Strings
 - DNS Resolution objects
 - Ping Replys
 - IPAddresses
 - ADComputer objects
 - CimSession objects
 - ...

## Extending Support to new types

New supported types can be added at runtime by the user or by other modules as they are imported.

This allows having one module understand the output of commands from another, without the two being aware of each other.

Example on how to add a custom object as accepted input:

```powershell
$object = [PSCustomObject]@{
    PSTypeName = "Foo.Bar"
    Name       = "MyHost"
}
Register-PSFParameterClassMapping -ParameterClass Computer -TypeName Foo.Bar -Properties Name
[PSFComputer]$object
```

## Notes
[Back to Parameter Classes](http://psframework.org/documentation/documents/psframework/parameter-classes.html)

| Version | 1.0 |
| Written on: | 2018-04-16 |
| Updated on: | 2018-05-23 |