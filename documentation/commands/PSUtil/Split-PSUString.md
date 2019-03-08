---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Split-PSUString

## SYNOPSIS
Splits a string.
In a pipeline.

## SYNTAX

### Regex (Default)
```
Split-PSUString [-InputString <String[]>] [[-With] <String>] [-Options <RegexOptions>] [<CommonParameters>]
```

### Simple
```
Split-PSUString [-InputString <String[]>] [[-With] <String>] [-Simple] [<CommonParameters>]
```

## DESCRIPTION
Splits a string.
In a pipeline.

## EXAMPLES

### EXAMPLE 1
```
"abc,def" | split ","
```

Returns "abc","def"

## PARAMETERS

### -InputString
The string(s) to split

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -With
Default: "\`n"
What to split the string with

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Simple
Whether to disable regex when splitting.

```yaml
Type: SwitchParameter
Parameter Sets: Simple
Aliases: r

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Options
Regex options to consider

```yaml
Type: RegexOptions
Parameter Sets: Regex
Aliases:
Accepted values: None, IgnoreCase, Multiline, ExplicitCapture, Compiled, Singleline, IgnorePatternWhitespace, RightToLeft, ECMAScript, CultureInvariant

Required: False
Position: Named
Default value: IgnoreCase
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String[]
## NOTES

## RELATED LINKS
