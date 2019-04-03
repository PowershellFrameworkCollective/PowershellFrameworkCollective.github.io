---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFRunspace

## SYNOPSIS
Returns registered runspaces.

## SYNTAX

```
Get-PSFRunspace [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of runspaces that have been registered with the PSFramework

## EXAMPLES

### EXAMPLE 1
```
Get-PSFRunspace
```

Returns all registered runspaces

### EXAMPLE 2
```
Get-PSFRunspace -Name 'mymodule.maintenance'
```

Returns the runspace registered under the name 'mymodule.maintenance'

## PARAMETERS

### -Name
Default: "*"
Only registered runspaces of similar names are returned.

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
