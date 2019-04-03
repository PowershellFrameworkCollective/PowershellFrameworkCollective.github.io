---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# ConvertFrom-PSFClixml

## SYNOPSIS
Converts data that was serialized from an object back into that object.

## SYNTAX

```
ConvertFrom-PSFClixml [-InputObject] <Object> [<CommonParameters>]
```

## DESCRIPTION
Converts data that was serialized from an object back into that object.

Use Import-PSFclixml to restore objects serialized and written to file.
This command is designed for converting serialized data in memory, for example to expand objects returned by a network api.

## EXAMPLES

### EXAMPLE 1
```
$data | ConvertFrom-PSFClixml
```

Converts the data stored in $data back into objects

## PARAMETERS

### -InputObject
The serialized data to restore to objects.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
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
