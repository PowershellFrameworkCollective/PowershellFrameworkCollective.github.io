---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# New-PSUDirectory

## SYNOPSIS
Creates a folder and moves the current path to it.

## SYNTAX

```
New-PSUDirectory [-Path] <Object> [<CommonParameters>]
```

## DESCRIPTION
Creates a folder and moves the current path to it.

## EXAMPLES

### EXAMPLE 1
```
mcd Test
```

creates folder C:\Test, then moves the current location to it.

## PARAMETERS

### -Path
Name of the folder to create and move to.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Donovan Brown
Source: http://donovanbrown.com/post/How-to-create-and-navigate-a-directory-with-a-single-command

Thank you for sharing and granting permission to use this convenience :)

## RELATED LINKS
