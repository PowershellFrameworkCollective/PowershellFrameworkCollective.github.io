---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Split-PSMDScriptFile

## SYNOPSIS
Parses a file and exports all top-level functions from it into a dedicated file, just for the function.

## SYNTAX

```
Split-PSMDScriptFile [[-File] <String[]>] [[-Path] <String>] [[-Encoding] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Parses a file and exports all top-level functions from it into a dedicated file, just for the function.
The original file remains unharmed by this.

Note: Any comments outside the function definition will not be copied.

## EXAMPLES

### EXAMPLE 1
```
Split-PSMDScriptFile -File ".\module.ps1" -Path .\files
```

Exports all functions in module.ps1 and puts them in individual files in the folder .\files.

## PARAMETERS

### -File
The file(s) to extract functions from.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
The folder to export to

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Encoding
Default: UTF8
The output encoding.
Can usually be left alone.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: UTF8
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
