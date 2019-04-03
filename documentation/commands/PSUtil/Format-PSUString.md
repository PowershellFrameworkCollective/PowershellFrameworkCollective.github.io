---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Format-PSUString

## SYNOPSIS
Allows formatting objects into strings.

## SYNTAX

```
Format-PSUString [-InputObject <Object>] [-Format] <String> [-LotSize <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Allows formatting objects into strings.
This is equivalent to the '-f' operator, but supports input from pipeline.

## EXAMPLES

### EXAMPLE 1
```
1..5 | format "foo {0:D2}"
```

returns "foo 01" through "foo 05"

### EXAMPLE 2
```
1..6 | format "foo {0:D3}-{1:D3}" -LotSize 2
```

returns "foo 001-002","foo 003-004","foo 005-006"

## PARAMETERS

### -InputObject
The object to format

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

### -Format
The format to apply to the object

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

### -LotSize
Default: 1
How many inputo bjects should be packed into the same format string.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
