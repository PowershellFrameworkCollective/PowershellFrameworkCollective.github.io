---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Import-PSMDModuleDebug

## SYNOPSIS
Invokes the preconfigured import of a module.

## SYNTAX

```
Import-PSMDModuleDebug [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Invokes the preconfigured import of a module.

## EXAMPLES

### EXAMPLE 1
```
Import-PSMDModuleDebug -Name 'cPSNetwork'
```

Imports the cPSNetwork module as it was configured to be imported using Set-ModuleDebug.

## PARAMETERS

### -Name
The exact name of the module to import using the specified configuration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
