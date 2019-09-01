---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDModuleDebug

## SYNOPSIS
Retrieves module debugging configurations

## SYNTAX

```
Get-PSMDModuleDebug [[-Filter] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a list of all matching module debugging configurations.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDModuleDebug -Filter *net*
```

Returns the module debugging configuration for all modules with a name that contains "net"

## PARAMETERS

### -Filter
Default: "*"
A string filter applied to the module name.
All modules of matching name (using a -Like comparison) will be returned.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
