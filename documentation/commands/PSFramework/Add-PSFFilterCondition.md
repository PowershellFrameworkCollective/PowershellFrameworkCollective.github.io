---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Add-PSFFilterCondition

## SYNOPSIS
Add a filter Condition to a Condition Set.

## SYNTAX

### ObjectName
```
Add-PSFFilterCondition -ConditionSet <ConditionSet> -Name <String[]> [-Module <String>] [<CommonParameters>]
```

### ObjectObject
```
Add-PSFFilterCondition -ConditionSet <ConditionSet> -Condition <Condition[]> [<CommonParameters>]
```

### NameName
```
Add-PSFFilterCondition -SetModule <String> -SetName <String> -Name <String[]> [-Module <String>]
 [<CommonParameters>]
```

### NameObject
```
Add-PSFFilterCondition -SetModule <String> -SetName <String> -Condition <Condition[]> [<CommonParameters>]
```

## DESCRIPTION
Add a filter Condition to a Condition Set.

## EXAMPLES

### EXAMPLE 1
```
Add-PSFFilterCondition -ConditionSet $barFilter -Name 'FromCellar'
```

Adds the Condition "FromCellar" to the Condition Set stored in $barFilter.
The Condition is chosen from the same module as the the Condition Set.

## PARAMETERS

### -ConditionSet
The Condition Set object to add to.

```yaml
Type: ConditionSet
Parameter Sets: ObjectName, ObjectObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetModule
Module of the Condition Set to which to add to.

```yaml
Type: String
Parameter Sets: NameName, NameObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetName
Name of the Condition Set to which to add to.

```yaml
Type: String
Parameter Sets: NameName, NameObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Condition
The condition object to add to the Condition Set.

```yaml
Type: Condition[]
Parameter Sets: ObjectObject, NameObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Name of the Condition to add to the Condition Set.

```yaml
Type: String[]
Parameter Sets: ObjectName, NameName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Module
Name of the Module the Condition being added comes from.
Defaults to the Module of the Condition Set if not specified

```yaml
Type: String
Parameter Sets: ObjectName, NameName
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

## NOTES

## RELATED LINKS
