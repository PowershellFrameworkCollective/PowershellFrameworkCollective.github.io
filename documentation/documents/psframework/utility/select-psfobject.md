---
title: Utility: Select-PSFObject
---
# Select-PSFObject

[Back to utility](http://psframework.org/documentation/documents/psframework/utility.html)

## Synopsis

`Select-PSFObject` completely replaces `Select-Object`, offering all of its functionality, but offering greater input comfort and more readable code by avoiding hashtables for simple operations. It also adds the ability to extend an object, rather than building a new object, fully replacing `Add-Member`.

## Description

### Property

The `-Property` parameter actually uses a parameter class as expected input type. It understands strings and hashtables. If passed a hashtable, it will pass that on to the `Select-Object` it wraps. If passed a string without whitespaces, that too will be passed along. Strings _with_ whitespaces however are parsed by the parameter class and converted into a hashtable, building the logic desired.

> Note: Since this can be used to execute code from string, this command should _not_ be exposed to direct user input, for example within a Jea Configuration.

Supported operations (many of which can be combined in any order):

> Renaming a property

```powershell
Get-ChildItem | Select-PSFObject Name, 'Length as Size'
```

By using a `'<property> as <new name>'` notation, it becomes possible to give a property a new name. If combined with `-KeepInputObject` this will instead _add_ a copy of the `<property>` (consider using `-Alias` instead, if you want it to point at the exact same value, as a copy will not update as the source is updated).

> Type-Casting a property

```powershell
Import-Csv .\files.csv | Select-PSFObject Name, 'Length to Long'
```

A simple way to convert the data type of properties using a `'<propert> to <new type>'` notation. It was specifically designed to easily reconstitute contents written to csv, but can be used in any other scenario as well, of course.

> Size formatting

```powershell
Get-ChildItem | Select-PSFObject Name, 'Length size GB:2:1'
```

It is possible to format large size values into a humanly readable format by using the `'<property> size <unit>:<# positions after the dot>[:1]'` notation. The last, optional `:1` is the indicator on whether to include the unit size in the output.

> Selecting from other variables (left join)

```powershell
$groups = Get-Something
Get-SomethingElse | Select-PSFObject Name, 'Value from groups WHERE ElseID = ID'
```

Using the `'<sourceProperty> from <sourcevariable> WHERE <sourceProperty> = <inputProperty>'` notation it becomes possible to easily match content from another list of objects, effectively performing a left join on it.

> Subproperties and method calls

One of the side products of this parser is that it will execute all code until the first whitespace, either on the input object or - in the `from` notation - the object selected from the other list of objects.

What this means, is that it becomes trivial to select subproperties or actually execute logic on it:

```powershell
Get-ChildItem | Select-PSFObject Name, 'LastWriteTime.Year as Year'
Get-ChildItem | Select-PSFObject Name, 'LastWriteTime.Add($timespan) as LastWriteTime'
```

### Alias

It is possible to add alias properties using the `-Alias` parameter:

```powershell
Get-ChildItem | Select-PSFObject Name, Length -Alias 'Length as Size'
```

It is also possible to use a hashtable, where the key becomes the alias name. With a hashtable, multiple entries can be defined and they may each point at different properties:

```powershell
Get-ChildItem | Select-PSFObject Name -Alias @{
    Foo = "Name"
    Bar = "Name"
    Zeta = "Bar"
}
```

### Typename

Objects can be given a name using the `-TypeName` parameter:

```powershell
$obj | Select-PSFObject -Typename 'Foo.Bar'
```

Which can be used to add properties or formats using XML files.
It also makes it easier to classify an object and track where it originally came from.

### Properties to show

The parameters `-ShowProperty` and `ShowExcludeProperty` allow you to whitelist or blacklist properties to show by default (when you don't want to do the full format xml).

```powershell
$obj | Select-PSFObject -ShowProperty 'Name', 'Length', 'Type'
$obj | Select-PSFObject -ShowExcludeProperty 'PSPath', 'PSProvider'
```

Whitelist takes precedence over blacklist.

### KeepInputObject

The `-KeepInputObject` switch is designed to keep the input item alive. This is critical when one wants to avoid the selected object from becoming ... well, a selected object type (basically, a named pscustomobject).

### Script Properties

Script properties have their values calculated as you request them.
These were traditionally added by using `Add-Member`, but can easily be attached using `Select-PSFObject` as well. There are several ways you can specify them using `Select-PSFObject`, depending on whether the property should be read only or not, and whether you want a shorthand string notation or the formalism of scriptblocks and hashtables. All of the three examples shown below do exactly the same thing:

```powershell
# Read only
Get-ChildItem | Select-PSFObject Name, Length -ScriptProperty 'Double := $this.Length * 2'
Get-ChildItem | Select-PSFObject Name, Length -ScriptProperty @{
    Double = { $this.Length * 2 }
}
Get-ChildItem | Select-PSFObject Name, Length -ScriptProperty @{
    Double = @{
        get = { $this.Length * 2 }
    }
}
```

For writeable properties, the second (simple hashtable) method cannot be used, but otherwise the implementation is simple:

```powershell
# Read/Write
Get-ChildItem | Select-PSFObject Name, Length -ScriptProperty 'Double := $this.Length * 2 =: $this.Length = $_ / 2'
Get-ChildItem | Select-PSFObject Name, Length -ScriptProperty @{
    Double = @{
        get = { $this.Length * 2 }
        set = { $this.Length = $_ / 2 }
    }
}
```

For the string notation, the definition is thus: `'<name> := <get script> [=: <set script>]'`.

> Generally, except for simple get properties, it is recommended to use hashtables and scripts to define scriptproperties, as those are easier to read in a PowerShell script editor and less error prone.

> Multiple scriptproperties can be defined in the same hashtable, including a wild mix of simple read-only or complex read/writeable ones.

### Script Methods

Similar to ScriptProperties, ScriptMethods can be defined through the `-ScriptMethod` parameter.
Also similar to ScriptProperties, there is a string and a hashtable/scriptblock option of doing so.

```powershell
Get-ChildItem | Select-PSFObject Name, Length -ScriptMethod 'Double => $this.Length * 2'
Get-ChildItem | Select-PSFObject Name, Length -ScriptMethod @{ Double = { $this.Length * 2 } }
```

## Notes

[Back to utility](http://psframework.org/documentation/documents/psframework/utility.html)

| Version | 1.0 |
| Written on: | 2018-10-23 |
| Updated on: | 2018-10-23 |