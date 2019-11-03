---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Export-PSFClixml

## SYNOPSIS
Writes objects to the filesystem.

## SYNTAX

```
Export-PSFClixml [-Path] <String> [-Depth <Int32>] [-InputObject <Object>] [-Style <ClixmlDataStyle>]
 [-NoCompression] [-PassThru] [-Encoding <EncodingParameter>] [<CommonParameters>]
```

## DESCRIPTION
Writes objects to the filesystem.
In opposite to the default Export-Clixml cmdlet, this function offers data compression as the default option.

Exporting to regular clixml is still supported though.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | Export-PSFClixml -Path 'C:\temp\data.byte'
```

Exports a list of all items in the current path as compressed binary file to C:\temp\data.byte

### EXAMPLE 2
```
Get-ChildItem | Export-PSFClixml -Path C:\temp\data.xml -Style 'String' -NoCompression
```

Exports a list of all items in the current path as a default clixml readable by Import-Clixml

## PARAMETERS

### -Path
The path to write to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Depth
Specifies how many levels of contained objects are included in the XML representation.
The default value is 2.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The object(s) to serialize.

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

### -Style
Whether to export as byte (better compression) or as string (often easier to transmit using other utilities/apis).

```yaml
Type: ClixmlDataStyle
Parameter Sets: (All)
Aliases:
Accepted values: String, Byte

Required: False
Position: Named
Default value: Byte
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoCompression
By default, exported data is compressed, saving a lot of storage at the cost of some CPU cycles.
This switch disables this compression, making string-style exports compatible with Import-Clixml.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Passes all objects along the pipeline.
By default, Export-PSFClixml does not produce output.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Encoding
The encoding to use when using string-style export.
By default, it exports as UTF8 encoding.

```yaml
Type: EncodingParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'PSFramework.Text.Encoding.DefaultWrite')
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
