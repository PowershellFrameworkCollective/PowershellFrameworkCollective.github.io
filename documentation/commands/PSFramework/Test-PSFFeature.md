---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFFeature

## SYNOPSIS
Tests whether a given feature has been enabled.

## SYNTAX

```
Test-PSFFeature [-Name] <String> [[-ModuleName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Tests whether a given feature has been enabled.
Use this within the feature-owning module to determine, whether a feature should be enabled or not.

## EXAMPLES

### EXAMPLE 1
```
Test-PSFFeature -Name PSFramework.InheritEnableException -ModuleName SPReplicator
```

Tests whether the module SPReplicator has enabled the Enable Exception Inheritance feature.

## PARAMETERS

### -Name
The feature to test for.

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

### -ModuleName
The name of the module that seeks to use the feature.
Must be specified in order to determine module-specific flags.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES

## RELATED LINKS
