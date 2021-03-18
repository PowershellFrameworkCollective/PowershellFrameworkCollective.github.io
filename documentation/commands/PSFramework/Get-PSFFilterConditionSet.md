---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFFilterConditionSet

## SYNOPSIS
Retrieve defined filter condition sets.

## SYNTAX

```
Get-PSFFilterConditionSet [[-Module] <String>] [[-Name] <String>] [[-Version] <Version>] [-AllVersions]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieve defined filter condition sets.
Filter condition sets are a grouped set of conditions used in filter expressions.
Create a filter expression by using New-PSFFilter.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFFilterConditionSet
```

List all defined filter condition sets.

### EXAMPLE 2
```
Get-PSFFilterConditionSet -Module PSFramework -Name Environment
```

Returns the filter condition set "Environment" from the module PSFramework.

## PARAMETERS

### -Module
The module to filter by.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the condition set to retrieve.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
Retrieve a specific version of the filter condition set.
By default, the latest version only is returned.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllVersions
Retrieve all versions of a given filter condition set.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
