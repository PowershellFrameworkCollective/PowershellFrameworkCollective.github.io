---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDHeader

## SYNOPSIS
Generates a header wrapping around text.

## SYNTAX

```
New-PSMDHeader [-Text] <String[]> [-BorderBottom <String>] [-BorderLeft <String>] [-BorderRight <String>]
 [-BorderTop <String>] [-CornerLB <String>] [-CornerLT <String>] [-CornerRB <String>] [-CornerRT <String>]
 [-MaxWidth] [-Padding <Int32>] [-TextAlignment <TextAlignment>] [-Width <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Generates a header wrapping around text.
The output is an object that contains the configuration options to generate a header.
Use its ToString() method (or cast it to string) to generate the header.

## EXAMPLES

### EXAMPLE 1
```
New-PSMDHeader -Text 'Example'
```

Will create a header labeled 'Example' that spans the entire screen.

### EXAMPLE 2
```
New-PSMDHeader -Text 'Example' -Width 80
```

Will create a header labeled 'Example' with a total width of 80:
 #----------------------------------------------------------------------------#
 #                                  Example                                   #
 #----------------------------------------------------------------------------#

### EXAMPLE 3
```
New-PSMDHeader -Text 'Example' -Width 80 -BorderLeft " |" -BorderRight "| " -CornerLB " \" -CornerLT " /" -CornerRB "/" -CornerRT "\"
```

Will create a header labeled "Example with a total width of 80 and some custom border lines:
 /----------------------------------------------------------------------------\
 |                                  Example                                   |
 \----------------------------------------------------------------------------/

## PARAMETERS

### -Text
The text to wrap into a header.
Can handle multiline text.
When passing a list of strings, each string will be wrapped into its own header.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -BorderBottom
The border used for the bottom of the frame.
Use a single letter, such as "-"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: -
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderLeft
The border used for the left side of the frame.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderRight
The border used for the right side of the frame.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderTop
The border used for the top of the frame.
Use a single letter, such as "-"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: -
Accept pipeline input: False
Accept wildcard characters: False
```

### -CornerLB
The symbol used for the left-bottom corner of the frame

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### -CornerLT
The symbol used for the left-top corner of the frame

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### -CornerRB
The symbol used for the right-bottom corner of the frame

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### -CornerRT
The symbol used for the right-top corner of the frame

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxWidth
Whether to align the frame's total width to the window width.

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

### -Padding
Whether the text should be padded.
Only applies to left/right aligned text.

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

### -TextAlignment
Default: Center
Whether the text should be aligned left, center or right.

```yaml
Type: TextAlignment
Parameter Sets: (All)
Aliases:
Accepted values: Left, Center, Right

Required: False
Position: Named
Default value: Center
Accept pipeline input: False
Accept wildcard characters: False
```

### -Width
Total width of the header.
Defaults to entire screen.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $Host.UI.RawUI.WindowSize.Width
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
