---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Expand-PSMDTypeName

## SYNOPSIS
Returns the full name of the input object's type, as well as the name of the types it inherits from, recursively until System.Object.

## SYNTAX

```
Expand-PSMDTypeName [[-InputObject] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Returns the full name of the input object's type, as well as the name of the types it inherits from, recursively until System.Object.

## EXAMPLES

### EXAMPLE 1
```
Expand-PSMDTypeName -InputObject "test"
```

Returns the typenames for the string test ("System.String" and "System.Object")

## PARAMETERS

### -InputObject
The object whose typename to expand.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
