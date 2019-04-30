---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDArgumentCompleter

## SYNOPSIS
Gets the registered argument completers.

## SYNTAX

```
Get-PSMDArgumentCompleter [[-CommandName] <String>] [-ParameterName <String>] [<CommonParameters>]
```

## DESCRIPTION
This function can be used to serach the argument completers registered using either the Register-ArgumentCompleter command or created using the ArgumentCompleter attribute.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDArgumentCompleter
```

Get all argument completers in use in the current PowerShell session.

## PARAMETERS

### -CommandName
Filter the results to a specific command.
Wildcards are supported.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: False
Position: 2
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ParameterName
Filter results to a specific parameter name.
Wildcards are supported.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
