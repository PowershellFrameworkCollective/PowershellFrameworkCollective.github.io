---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# ConvertTo-PSFHashtable

## SYNOPSIS
Converts an object into a hashtable.

## SYNTAX

```
ConvertTo-PSFHashtable [[-Exclude] <String[]>] [[-InputObject] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Converts an object into a hashtable.
Can exclude individual properties from being included.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | ConvertTo-PSFHashtable
```

Scans all items in the current path and converts those objects into hashtables.

## PARAMETERS

### -Exclude
The propertynames to exclude.
Must be full property-names, no wildcard/regex matching.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The object(s) to convert

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Collections.Hashtable
## NOTES

## RELATED LINKS
