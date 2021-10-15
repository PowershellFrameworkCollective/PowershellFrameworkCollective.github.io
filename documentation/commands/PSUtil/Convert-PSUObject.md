---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Convert-PSUObject

## SYNOPSIS
Converts objects from one data-type/-format to another.

## SYNTAX

```
Convert-PSUObject -InputObject <Object> [-From] <String> [-To] <String> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Converts objects from one data-type/-format to another.
For example can this be used to convert numbers from binary to hex.

This function can be dynamically extended by registering conversion paths.
Use Register-PSUObjectConversion to set up such a type conversion.

## EXAMPLES

### EXAMPLE 1
```
100..110 | convert dec hex
```

Converts the numbers 100 through 110 from decimal to hexadecimal.

## PARAMETERS

### -InputObject
The object(s) to convert.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -From
The type/format that is assumed to be the input type.

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

### -To
The type/format that the input is attempted to convert to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
