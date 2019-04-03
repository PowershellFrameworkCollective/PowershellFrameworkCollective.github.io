---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Backup-PSULocation

## SYNOPSIS
Sets the location n number of levels up.

## SYNTAX

```
Backup-PSULocation [[-Levels] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
You no longer have to cd ..\..\..\..\ to move back four levels.
You can now
just type bu 4

## EXAMPLES

### EXAMPLE 1
```
bu 4
```

PS C:\Users\dlbm3\>

## PARAMETERS

### -Levels
Number of levels to move back.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Get-PSFConfigValue -FullName 'PSUtil.Path.BackupStepsDefault' -Fallback 1)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Donovan Brown
Source: http://donovanbrown.com/post/Why-cd-when-you-can-just-backup

Thank you for sharing and granting permission to use this convenience :)

## RELATED LINKS
