---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# ConvertTo-PSFClixml

## SYNOPSIS
Converts an input object into a serialized string or byte array.

## SYNTAX

```
ConvertTo-PSFClixml [[-Depth] <Int32>] [[-InputObject] <Object>] [[-Style] <ClixmlDataStyle>] [-NoCompression]
 [<CommonParameters>]
```

## DESCRIPTION
Converts an input object into a serialized string or byte array.
Works analogous to Export-PSFClixml, only it does not require being written to file.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | ConvertTo-PSFClixml
```

Scans all items in the current folder and then converts that into a compressed clixml string.

## PARAMETERS

### -Depth
Specifies how many levels of contained objects are included in the XML representation.
The default value is 2.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
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
Position: 3
Default value: String
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
