---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUDrive

## SYNOPSIS
Creates a new psdrive, and moves location to it.

## SYNTAX

```
Set-PSUDrive [-Name] <Object> [[-Root] <String>] [<CommonParameters>]
```

## DESCRIPTION
Will create a PSDrive, by default in the current path.
This allows swiftly reducing path length.
Then it will immediately change location to the new drive.

## EXAMPLES

### EXAMPLE 1
```
set-as pr
```

Sets the current path as drive "pr" and sets it as the current location.

## PARAMETERS

### -Name
What to name the new PSDrive?

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

### -Root
Default: .
The root of the new drive.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Donovan Brown
Source: http://donovanbrown.com/post/Shorten-your-PowerShell-directory-path

Thank you for sharing and granting permission to use this convenience :)

## RELATED LINKS
