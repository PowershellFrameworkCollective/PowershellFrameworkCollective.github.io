---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFFeature

## SYNOPSIS
Toggles a feature on or off.

## SYNTAX

```
Set-PSFFeature [-Name] <String> [-Value] <Boolean> [[-ModuleName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Toggles a feature on or off.
This controls the flags for optional features a module might offer.

Features can be controlled globally or specific to a module that tries to consume it.
Module specific settings can override global settings, if a feature supports both global and module flags.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFFeature -Name 'PSFramework.InheritEnableException' -Value $true -ModuleName SPReplicator
```

This sets the flag for the Enable Exception Inheritance Name to $true, but only applies to the module SPReplicator.

### EXAMPLE 2
```
Set-PSFFeature -Name 'MyModule.Feierabend' -Value $true
```

This enables the global flag for the MyModule.Feierabend feature.

## PARAMETERS

### -Name
The name of the feature to set.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Value
The value to set it to.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleName
The module it should apply to.
Specifying this parameter sets the flag only for the module specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
