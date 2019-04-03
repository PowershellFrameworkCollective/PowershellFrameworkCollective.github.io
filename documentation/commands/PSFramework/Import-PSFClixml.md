---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Import-PSFClixml

## SYNOPSIS
Imports objects serialized using Export-Clixml or Export-PSFClixml.

## SYNTAX

```
Import-PSFClixml [-Path] <String[]> [-Encoding <EncodingParameter>] [<CommonParameters>]
```

## DESCRIPTION
Imports objects serialized using Export-Clixml or Export-PSFClixml.

It can handle compressed and non-compressed exports.

## EXAMPLES

### EXAMPLE 1
```
Import-PSFClixml -Path '.\object.xml'
```

Imports the objects serialized to object.xml in the current folder.

## PARAMETERS

### -Path
Path to the files to import.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Encoding
Text-based files might be stored with any arbitrary encoding chosen.
By default, this function assumes UTF8 encoding (the default export encoding for Export-PSFClixml).

```yaml
Type: EncodingParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'psframework.text.encoding.defaultread' -Fallback 'utf-8')
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
