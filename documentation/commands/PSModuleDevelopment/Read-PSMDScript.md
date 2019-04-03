---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Read-PSMDScript

## SYNOPSIS
Parse the content of a script

## SYNTAX

### Script
```
Read-PSMDScript [-ScriptCode] <ScriptBlock> [<CommonParameters>]
```

### File
```
Read-PSMDScript -Path <String[]> [<CommonParameters>]
```

## DESCRIPTION
Uses the powershell parser to parse the content of a script or scriptfile.

## EXAMPLES

### EXAMPLE 1
```
Read-PSMDScript -ScriptCode $ScriptCode
```

Parses the code in $ScriptCode

### EXAMPLE 2
```
Get-ChildItem | Read-PSMDScript
```

Parses all script files in the current directory

## PARAMETERS

### -ScriptCode
The scriptblock to parse.

```yaml
Type: ScriptBlock
Parameter Sets: Script
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to the scriptfile to parse.
Silently ignores folder objects.

```yaml
Type: String[]
Parameter Sets: File
Aliases: FullName

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
