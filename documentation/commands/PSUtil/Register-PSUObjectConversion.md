---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Register-PSUObjectConversion

## SYNOPSIS
Registers an object conversion for Convert-PSUObject.

## SYNTAX

```
Register-PSUObjectConversion [-From] <String> [-To] <String> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION
This command can be used to register an object conversion for Convert-PSUObject, allowing the user to extend the conversion utility as desired.

## EXAMPLES

### EXAMPLE 1
```
Register-PSUObjectConversion -From 'dec' -To 'oct' -ScriptBlock $ScriptBlock
```

Registers a conversion that is supposed to convert a decimal into an octal number.

## PARAMETERS

### -From
The input type.
Using a suitable shorthand is recommended ("int" rather than "System.Int32", etc.).

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
The conversion target type.
Using a suitable shorthand is recommended ("int" rather than "System.Int32", etc.).

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

### -ScriptBlock
The scriptblock that will be invoked to convert.
Receives a single argument: The input object to convert.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
