---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDAssembly

## SYNOPSIS
Returns the assemblies currently loaded.

## SYNTAX

```
Get-PSMDAssembly [[-Filter] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the assemblies currently loaded.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDAssembly
```

Lists all imported libraries

### EXAMPLE 2
```
Get-PSMDAsssembly -Filter "Microsoft.*"
```

Lists all imported libraries whose name starts with "Microsoft.".

## PARAMETERS

### -Filter
Default: *
The name to filter by

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
