---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Expand-PSUObject

## SYNOPSIS
A comfortable replacement for Select-Object -ExpandProperty.

## SYNTAX

### Equals (Default)
```
Expand-PSUObject [[-Name] <String>] [-InputObject <Object>] [<CommonParameters>]
```

### Match
```
Expand-PSUObject [-Name] <String> [-Match] [-InputObject <Object>] [<CommonParameters>]
```

### Like
```
Expand-PSUObject [-Name] <String> [-Like] [-InputObject <Object>] [<CommonParameters>]
```

## DESCRIPTION
A comfortable replacement for Select-Object -ExpandProperty.
Allows extracting properties with less typing and more flexibility:

Preferred Properties:
By defining a list of property-names in $DefaultExpandedProperties the user can determine his own list of preferred properties to expand.
This allows using this command without specifying a property at all.
It will then check the first object for the property to use (starting from the first element of the list until it finds an exact case-insensitive match).

Defined Property:
The user can specify the exact property to extract.
This is the same behavior as Select-Object -ExpandProperty, with less typing (dir | exp length).

Like / Match comparison:
Specifying either like or match allows extracting any number of matching properties from each object.
Note that this is a somewhat more CPU-expensive operation (which shouldn't matter unless with gargantuan numbers of objects).

## EXAMPLES

### EXAMPLE 1
```
dir | exp
```

Expands the property whose name is the first on the defaults list ($DefaultExpandedProperties).
By default, FullName would be expanded.

### EXAMPLE 2
```
dir | exp length
```

Expands the length property of all objects returned by dir.
Simply ignores those that do not have the property (folders).

### EXAMPLE 3
```
dir | exp name -match
```

Expands all properties from all objects returned by dir that match the string "name" ("PSChildName", "FullName", "Name", "BaseName" for directories)

## PARAMETERS

### -Name
ParSet: Equals, Like, Match
The name of the Property to expand.

```yaml
Type: String
Parameter Sets: Equals
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Match, Like
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Like
ParSet: Like
Expands all properties that match the -Name parameter using -like comparison.

```yaml
Type: SwitchParameter
Parameter Sets: Like
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Match
ParSet: Match
Expands all properties that match the -Name parameter using -match comparison.

```yaml
Type: SwitchParameter
Parameter Sets: Match
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The objects whose properties are to be expanded.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
