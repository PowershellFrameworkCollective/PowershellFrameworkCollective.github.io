---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Compare-PSFArray

## SYNOPSIS
Compares two arrays.

## SYNTAX

```
Compare-PSFArray [-ReferenceObject] <Object[]> [-DifferenceObject] <Object[]> [-OrderSpecific] [-Quiet]
 [<CommonParameters>]
```

## DESCRIPTION
Compares two arrays.

## EXAMPLES

### EXAMPLE 1
```
Compare-PSFArray -ReferenceObject $arraySource -DifferenceObject $arrayDestination -Quiet -OrderSpecific
```

Compares the two sets of objects, and returns ...
- $true if both sets contains the same objects in the same order
- $false if they do not

## PARAMETERS

### -ReferenceObject
The first array to compare with the second array.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DifferenceObject
The second array to compare with the first array.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrderSpecific
Makes the comparison order specific.
By default, the command does not care for the order the objects are stored in.

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

### -Quiet
Rather than returning a delta report object, return a single truth statement:
- $true if the two arrays are equal
- $false if the two arrays are NOT equal.

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
