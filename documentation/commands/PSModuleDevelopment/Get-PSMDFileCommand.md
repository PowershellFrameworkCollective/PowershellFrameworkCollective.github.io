---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDFileCommand

## SYNOPSIS
Parses a scriptfile and returns the contained/used commands.

## SYNTAX

```
Get-PSMDFileCommand [-Path] <String[]> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Parses a scriptfile and returns the contained/used commands.
Use this to determine, what command resources are being used.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDFileCommand -Path './task_usersync.ps1'
```

Parses the scriptfile task_usersync.ps1 for commands used.

## PARAMETERS

### -Path
The path to the scriptfile to parse.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
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
