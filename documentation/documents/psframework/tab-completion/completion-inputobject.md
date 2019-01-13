---
title: tab-completion: completion-inputobject
---
# Completion: Input Object Properties
## Synopsis

The custom tab completion `PSFramework-Input-ObjectProperty` provides comprehensive & extensible tab completion for the properties the input object will have.

## Description

### Basic Use

This completion can be assigned to any arbitrary command & parameter combination using this line:

```powershell
Register-PSFTeppArgumentCompleter -Command <commandname> -Parameter <parametername> -Name PSFramework-Input-ObjectProperty
```

This will add tab completion to the specified parameter, picking up the properties the input object will likely have.

### Extending the completion

This completion works, by parsing the Abstract Syntax Tree (AST) of all elements before it in the pipeline. It figures out what objects it will receive by the `[OutputType()]` of a command, inspects the contents of variables that offer input and checks what additional properties may be added - or removed - using `Select-Object` or `Select-PSFObject`. However, this is not always enough!

Specifically, a command may not advertise its returned objects, or the objects might be modified through type extension of the PowerShell Type system. In order to offer full control over the tab completion's values, the detected properties can be _augmented_ using an extension system:

#### Basic property info

Each extension object must have three properties:

 - Name (The property name)
 - Type (The type of the property. `$null` if unknown)
 - TypeKnown (Boolean, whether the type is known)

Example object:

```powershell
[PSCustomObject]@{
    Name      = 'PSChildName'
    Type      = ([type]'System.String')
    TypeKnown = $true
}
```

#### Extending a type

In order to extend a type, insert a list of properties into the mapping dictionary under the typename.
The Typename is *case sensitive* !

```powershell
[PSFramework.TabExpansion.TabExpansionHost]::InputCompletionTypeData['<Typename>'] = <array of properties>
```

Or a live example:

```powershell
[PSFramework.TabExpansion.TabExpansionHost]::InputCompletionTypeData['System.IO.FileInfo'] = @(
    [PSCustomObject]@{
        Name      = 'PSChildName'
        Type      = ([type]'System.String')
        TypeKnown = $true
    },
    [PSCustomObject]@{
        Name      = 'PSDrive'
        Type      = ([type]'System.Management.Automation.PSDriveInfo')
        TypeKnown = $true
    }
)
```

#### Extending a Command

The same basic rules apply when extending a command.
In order to extend a command, insert a list of properties into the mapping dictionary under the commandname.
The name of the command is *case sensitive* !

```powershell
[PSFramework.TabExpansion.TabExpansionHost]::InputCompletionCommandData['<Command Name>'] = <array of properties>
```

Or in action:

```powershell
[PSFramework.TabExpansion.TabExpansionHost]::InputCompletionTypeData['Get-ChildItem'] = @(
    [PSCustomObject]@{
        Name      = 'PSChildName'
        Type      = ([type]'System.String')
        TypeKnown = $true
    },
    [PSCustomObject]@{
        Name      = 'PSDrive'
        Type      = ([type]'System.Management.Automation.PSDriveInfo')
        TypeKnown = $true
    }
)
```

#### What to extend

With the ability to extend both types and commands comes the question, what to actually apply extension to.

Generally, unless it is a PSCustomObject or something the command applies explicitly to individual instances of an object, it is better to extend the type, rather than the command.

## Notes

[Back to tab-completion](http://psframework.org/documentation/documents/PSFramework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2019-01-13 |
| Updated on: | 2019-01-13 |