---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Measure-PSMDLinesOfCode

## SYNOPSIS
Measures the lines of code ina PowerShell scriptfile.

## SYNTAX

```
Measure-PSMDLinesOfCode [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Measures the lines of code ina PowerShell scriptfile.
This scan uses the AST to figure out how many lines contain actual functional code.

## EXAMPLES

### EXAMPLE 1
```
Measure-PSMDLinesOfCode -Path .\script.ps1
```

Measures the lines of code in the specified file.

### EXAMPLE 2
```
Get-ChildItem C:\Scripts\*.ps1 | Measure-PSMDLinesOfCode
```

Measures the lines of code for every single file in the folder c:\Scripts.

## PARAMETERS

### -Path
Path to the files to scan.
Folders will be ignored.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName

Required: True
Position: 1
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
