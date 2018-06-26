---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUString

## SYNOPSIS
Replaces a part of the input string with another.

## SYNTAX

### regex (Default)
```
Set-PSUString [-InputString <String[]>] [-What] <String> [-With] <Object> [-EnableException]
 [<CommonParameters>]
```

### Simple
```
Set-PSUString [-InputString <String[]>] [-What] <String> [-With] <Object> [-Simple] [-EnableException]
 [<CommonParameters>]
```

### Regex
```
Set-PSUString [-InputString <String[]>] [-What] <String> [-With] <Object> [-Options <RegexOptions>]
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Replaces a part of the input string with another.
Supports both regex replace as well as regular .replace().

## EXAMPLES

### EXAMPLE 1
```
"abc ABC" | replace b d
```

Returns "adc AdC".

### EXAMPLE 2
```
"abc ABC" | replace b d -Options None
```

Returns "adc ABC"

### EXAMPLE 3
```
"abc \def" | replace "\de" "&ed" -s
```

Returns "abc &edf"

## PARAMETERS

### -InputString
The stringgs on which replacement will be performed.

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

### -What
What should be replace?

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

### -With
With what should it be replaced?

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Simple
By default, this function uses regex replace.
Sometimes this may not be desirable.
This switch enforces simple replacement, not considering any regular expression functionality.

```yaml
Type: SwitchParameter
Parameter Sets: Simple
Aliases: s

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Options
Default: IgnoreCase
When using regex replace, it may become desirable to specify options to the system.

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

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS
