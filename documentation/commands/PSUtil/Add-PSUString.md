---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Add-PSUString

## SYNOPSIS
Makes it easy to add content to a string at pipeline.

## SYNTAX

```
Add-PSUString [-InputString <String[]>] [[-Before] <String>] [[-After] <String>] [<CommonParameters>]
```

## DESCRIPTION
Makes it easy to add content to a string at pipeline.

## EXAMPLES

### EXAMPLE 1
```
1..10 | Add-PSUString "srv-ctx" "-dev"
```

Returns a set of strings from 'srv-ctx1-dev' through 'srv-ctx10-dev'

## PARAMETERS

### -InputString
The string(s) to add content to

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

### -Before
What is prepended to the input string.

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

### -After
What is appended to the input string

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
