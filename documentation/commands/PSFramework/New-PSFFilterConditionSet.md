---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFFilterConditionSet

## SYNOPSIS
Create a new filter condition set.

## SYNTAX

### default (Default)
```
New-PSFFilterConditionSet -Module <String> -Name <String> [-Version <Version>] [<CommonParameters>]
```

### Objects
```
New-PSFFilterConditionSet -Module <String> -Name <String> [-Version <Version>] [-Conditions <Condition[]>]
 [<CommonParameters>]
```

### Scriptblock
```
New-PSFFilterConditionSet -Module <String> -Name <String> [-Version <Version>] [-ScriptBlock <ScriptBlock>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new filter condition set.
A filter condition set is a grouping of filter conditions.
These sets are referenced when creating or invoking a filter expression and are the logic implementation used to evaluate the expression.

Individual filter conditions can be added, and ...
- Not all Conditions in a set need be used in any given Filter expression using that set.
- Not all Conditions must be from the same module as the Condition Set.

## EXAMPLES

### EXAMPLE 1
```
New-PSFFilterConditionSet -Module 'Bartender' -Name 'Alcohols'
```

Defines a new Condition Set named Alcohols in the module Bartender.
This set is created empty and must later be filled with Conditions before using it.

### EXAMPLE 2
```
Get-PSFFilterCondition -Module Bartender | New-PSFFilterConditionSet -Module 'Bartender' -Name 'Alcohols'
```

Defines a new Condition Set named Alcohols in the module Bartender.
Adds all Conditions defined in the same module to it.

### EXAMPLE 3
```
New-PSFFilterConditionSet -Module 'Bartender' -Name 'Alcohols' -ScriptBlock {
	New-PSFFilterCondition -Module Bartender -Name Beer -ScriptBlock { $_.Type -eq 'Beer' }
	New-PSFFilterCondition -Module Bartender -Name Vodka -ScriptBlock { $_.Type -eq 'Vodka' }
	New-PSFFilterCondition -Module Bartender -Name Whiskey -ScriptBlock { $_.Type -eq 'Whiskey' }
	New-PSFFilterCondition -Module Bartender -Name Rum -ScriptBlock { $_.Type -eq 'Rum' }
}
```

Defines a new Condition Set named Alcohols in the module Bartender.
Adds the four newly created Coditions straight to the Set.

## PARAMETERS

### -Module
The module that owns the filter condition set.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the filter condition set.
This name is unique within any given module.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
The version of the filter condition set.
You can provide multiple versions of a set for backwards compatiblity, however selecting the correct version for your expressions is your own responsibility.
Defaults to 1.0.0

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1.0.0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Conditions
The conditions that are part of the Condition Set.
These are the individual technical implementations used to evaluate a fitler expression.
Use New-PSFFilterCondition to define these objects or Get-PSFFilterCondition to retrieve already defined objects.

```yaml
Type: Condition[]
Parameter Sets: Objects
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ScriptBlock
A Scriptblock that will be executed and all Filter Condition objects returned will become part of the set.
This allows combining the definition of a Condition Set and its component Conditions into a single call.

```yaml
Type: ScriptBlock
Parameter Sets: Scriptblock
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.Filter.ConditionSet
## NOTES

## RELATED LINKS
