---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# ConvertFrom-PSFArray

## SYNOPSIS
Flattens properties that have array values.

## SYNTAX

```
ConvertFrom-PSFArray [[-JoinBy] <String>] [[-PropertyName] <String[]>] [-InputObject <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
Flattens properties that have array values.
With this you can prepare objects for export to systems that cannot handle collection in propertyvalues.
This flattening happens using a string join operation, so the output on modified properties is guaranteed to be a string.

## EXAMPLES

### EXAMPLE 1
```
Get-Something | ConvertFrom-PSFArray | Export-Csv -Path .\output.csv
```

Processes the output of Get-Something in order to produce a flat table to export data to csv without trimming collections.

## PARAMETERS

### -JoinBy
The string sequence to join values by.
Defaults to ", "

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: ,
Accept pipeline input: False
Accept wildcard characters: False
```

### -PropertyName
The properties to affect.
Interprets wildcards, defaults to '*'.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The objects the properties of which to flatten.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
