---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Select-PSUObjectSample

## SYNOPSIS
Used to only pick a sample from the objects passed to the function.

## SYNTAX

```
Select-PSUObjectSample -InputObject <Object> [[-Skip] <Int32>] [[-Number] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Used to only pick a sample from the objects passed to the function.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | Select-PSUObjectSample -Skip 1 -Number 3
```

Scans the current directory, skips the first returned object, then passes through the next three objects and skips the rest.

### EXAMPLE 2
```
dir | s 3 1
```

Same as the previous example, only this time using aliases and positional binding.
Scans the current directory, skips the first returned object, then passes through the next three objects and skips the rest.

## PARAMETERS

### -InputObject
The objects to pick a sample from.

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

### -Skip
How many objects to skip.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Number
How many objects to pick
Use a negative number to pick the last X items instead.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
