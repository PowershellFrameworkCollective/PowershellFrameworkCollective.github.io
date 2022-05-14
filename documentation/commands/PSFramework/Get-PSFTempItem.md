---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFTempItem

## SYNOPSIS
List existing temporary items.

## SYNTAX

```
Get-PSFTempItem [[-Name] <String>] [[-ModuleName] <String>] [<CommonParameters>]
```

## DESCRIPTION
List existing temporary items.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFTempItem
```

List all existing temporary items.

## PARAMETERS

### -Name
Name of the item to filter by.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ModuleName
Name of the module to filter by.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
