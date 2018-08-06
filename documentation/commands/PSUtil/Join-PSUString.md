---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Join-PSUString

## SYNOPSIS
Joins input strings together.

## SYNTAX

```
Join-PSUString [-InputString <String[]>] [[-With] <String>] [-BatchSize <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Joins input strings together.

## EXAMPLES

### EXAMPLE 1
```
1..9 | join ","
```

Returns "1,2,3,4,5,6,7,8,9"

### EXAMPLE 2
```
1..9 | join "," -BatchSize 5
```

Returns "1,2,3,4,5", "6,7,8,9"

## PARAMETERS

### -InputString
The strings to join

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
What to join the strings with.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: ([System.Environment]::NewLine)
Accept pipeline input: False
Accept wildcard characters: False
```

### -BatchSize
Default: 0
How many to join together at a time.
If 0 or lower are specfied, all strings will be joined together.
Otherwise, it will join \[BatchSize\] strigns together at a time.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
