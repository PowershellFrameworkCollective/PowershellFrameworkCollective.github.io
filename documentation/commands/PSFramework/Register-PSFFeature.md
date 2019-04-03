---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFFeature

## SYNOPSIS
Registers a feature for use in the PSFramework Feature Flag System.

## SYNTAX

```
Register-PSFFeature [-Name] <String> [[-Description] <String>] [-NotGlobal] [-NotModuleSpecific]
 [[-Owner] <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers a feature for use in the PSFramework Feature Flag System.
This allows offering a common interface for enabling and disabling features on-demand.
Typical use-cases:
- Experimental Features
- Reverting breaking behavior on a per-module basis.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFFeature -Name 'MyModule.DividebyZeroExp' -Description 'Attempt to divide by zero' -Owner MyModule
```

Registers the feature under its owning module and adds a nice description.

## PARAMETERS

### -Name
The name of the feature to register.
Feature names are scoped globally, so please prefix by your own module's name.

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

### -Description
A description of the feature, so users can discover what it is about.

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

### -NotGlobal
Disables global flags for this feature.
By default, features can be enabled or disabled on a global scope.

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

### -NotModuleSpecific
Disables module specific feature flags.
By default, individual modules can override the global settings either way.
This may not really be applicable for all features however.

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

### -Owner
The name of the module owning the feature.
Autodiscovery is attempted, but it is recommended to explicitly specify the owning module's name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Get-PSCallStack)[1].InvocationInfo.MyCommand.ModuleName
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
