---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDBuildAction

## SYNOPSIS
Get a list of registered build actions.

## SYNTAX

```
Get-PSMDBuildAction [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get a list of registered build actions.
Actions are the scriptblocks that are used to execute the build logic when running Invoke-PSMDBuildProject.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDBuildAction
```

Get a list of all registered build actions.

## PARAMETERS

### -Name
The name by which to filter the actions returned.
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
