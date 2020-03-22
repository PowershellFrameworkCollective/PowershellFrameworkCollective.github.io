---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Out-PSUVariable

## SYNOPSIS
Writes the input to a variable.

## SYNTAX

```
Out-PSUVariable [-Name] <String> [-InputObject <Object>] [<CommonParameters>]
```

## DESCRIPTION
Writes the input to a variable.
This allows doing variable assignments at the end of a pipeline, rather than just at the beginning.

Previous contents will be overwritten.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | Out-PSUVariable -Name 'files'
```

Writes the files & folders in the current path into the variable $files

### EXAMPLE 2
```
dir | ov files
```

Does the same thing as the first example, only this time in a convenient interactive commandline usage

## PARAMETERS

### -Name
The name of the variable to write to.

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

### -InputObject
The objects to write.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
