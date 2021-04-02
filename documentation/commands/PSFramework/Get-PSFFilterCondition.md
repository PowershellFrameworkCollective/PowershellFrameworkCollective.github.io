---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFFilterCondition

## SYNOPSIS
Retrieve defined filter conditions.

## SYNTAX

### default (Default)
```
Get-PSFFilterCondition [-Module <String>] [-Name <String>] [-SetName <String>] [<CommonParameters>]
```

### Version
```
Get-PSFFilterCondition [-Module <String>] [-Name <String>] [-SetName <String>] [-Version <Version>]
 [<CommonParameters>]
```

### AllVersion
```
Get-PSFFilterCondition [-Module <String>] [-Name <String>] [-SetName <String>] [-AllVersions]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieve defined filter conditions.
Filter conditions can be used as part of a condition set, used to evaluate filter expressions defined with New-PSFFilter.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFFilterCondition
```

List all defined filter conditions.

### EXAMPLE 2
```
Get-PSFFilterCondition -Module PSFramework -Name OSWindows
```

Returns the filter condition "OSWindows" from the module PSFramework.

## PARAMETERS

### -Module
The module to filter by.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the condition to retrieve.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetName
The name of the condition set the condition is assigned to.
Allows searching by assignment.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
Retrieve a specific version of the filter condition.
By default, the latest version only is returned.

```yaml
Type: Version
Parameter Sets: Version
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllVersions
Retrieve all versions of a given filter condition.

```yaml
Type: SwitchParameter
Parameter Sets: AllVersion
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

### PSFramework.Filter.Condition
## NOTES

## RELATED LINKS
