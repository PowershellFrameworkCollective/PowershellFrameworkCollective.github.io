---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Show-PSMDSyntax

## SYNOPSIS
Validate or show parameter set details with colored output

## SYNTAX

```
Show-PSMDSyntax [-CommandText] <String> [[-Mode] <String>] [-Legend] [<CommonParameters>]
```

## DESCRIPTION
Analyze a function and it's parameters

The cmdlet / function is capable of validating a string input with function name and parameters

## EXAMPLES

### EXAMPLE 1
```
Show-PSMDSyntax -CommandText "New-Item -Path 'c:\temp\newfile.txt'"
```

This will validate all the parameters that have been passed to the Import-D365Bacpac cmdlet.
All supplied parameters that matches a parameter will be marked with an asterisk.

### EXAMPLE 2
```
Show-PSMDSyntax -CommandText "New-Item" -Mode "ShowParameters"
```

This will display all the parameter sets and their individual parameters.

## PARAMETERS

### -CommandText
The string that you want to analyze

If there is parameter value present, you have to use the opposite quote strategy to encapsulate the string correctly

E.g.
for double quotes
-CommandText 'New-Item -Path "c:\temp\newfile.txt"'

E.g.
for single quotes
-CommandText "New-Item -Path 'c:\temp\newfile.txt'"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode
The operation mode of the cmdlet / function

Valid options are:
- Validate
- ShowParameters

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Validate
Accept pipeline input: False
Accept wildcard characters: False
```

### -Legend
Include a legend explaining the color mapping

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
Author: Mötz Jensen (@Splaxi)
Twitter: https://twitter.com/splaxi
Original github project: https://github.com/d365collaborative/d365fo.tools

## RELATED LINKS
