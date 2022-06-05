---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Join-PSFPath

## SYNOPSIS
Performs multisegment path joins.

## SYNTAX

```
Join-PSFPath [-Path] <String> [-Child <String[]>] [-Normalize] [<CommonParameters>]
```

## DESCRIPTION
Performs multisegment path joins.

## EXAMPLES

### EXAMPLE 1
```
Join-PSFPath -Path 'C:\temp' 'Foo' 'Bar'
```

Returns 'C:\temp\Foo\Bar'

### EXAMPLE 2
```
Join-PSFPath -Path 'C:\temp' 'Foo' 'Bar' -Normalize
```

Returns 'C:\temp\Foo\Bar' on a Windows OS.
Returns 'C:/temp/Foo/Bar' on most non-Windows OSes.

## PARAMETERS

### -Path
The basepath to join on.

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

### -Child
Any number of child paths to add.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: ChildPath

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Normalize
Normalizes path separators for the path segments offered.
This ensures the correct path separators for the current OS are chosen.

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
