---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFFilterCondition

## SYNOPSIS
Create a new filter condition used in filter expressions.

## SYNTAX

```
New-PSFFilterCondition [-Module] <String> [-Name] <String> [-ScriptBlock] <PsfScriptBlock>
 [[-Version] <Version>] [[-Type] <ConditionType>] [<CommonParameters>]
```

## DESCRIPTION
Create a new filter condition used in filter expressions.
A filter condition is a named scriptblock that is designed evaluates either the environment or an input object.
It should never throw an exception and instead return $true or $false.

Using a filter expression then allows the user to dynamically build a truth statement by combining any number of conditions through boolean operators.

## EXAMPLES

### EXAMPLE 1
```
New-PSFFilterCondition -Module 'MyModule' -Name 'HasTemp' -ScriptBlock { Test-Path -Path C:\temp }
```

Creates a condition named "HasTemp" that is part of the MyModule module.
When executed, it will validate, whether the temp folder exists.

## PARAMETERS

### -Module
The module that owns/defines the condition.
Use your own module's name to avoid conflicting with foreign modules.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the condition.
Can only contain letters, numbers and underscore.
A name is unique within a module.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
The scriptblock that is used to execute the condition.
This scriptblock is bound to the context that defined it and thus runspace specific.
This means, if you define it within your module, it will have access to module interna, such as private functions.

```yaml
Type: PsfScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
The version number of the condition.
There can exist multiple versions of a condition at any given time, but only version can exist in a single Condition Set.
Defaults to 1.0.0

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 1.0.0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
What kind of condition is this:
Static:
A condition that will not change during the runtime of the process.
   For example the operating system.
Static conditions are executed only once on their first run.

Dynamic:
Dynamic conditions will be executed every single time an expression that uses it is evaluated.
Note: An expression may use the same condition multiple times, but it will still only be run once.

```yaml
Type: ConditionType
Parameter Sets: (All)
Aliases:
Accepted values: Static, Dynamic

Required: False
Position: 5
Default value: Dynamic
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.Filter.Condition
## NOTES

## RELATED LINKS
