---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_language_modes?view=powershell-7.1#constrained-language-constrained-language
schema: 2.0.0
---

# Test-PSMDClmCompatibility

## SYNOPSIS
Tests, whether the targeted file would have trouble executing under Constrained Language Mode.

## SYNTAX

```
Test-PSMDClmCompatibility [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Tests, whether the targeted file would have trouble executing under Constrained Language Mode (CLM).

In CLM, various language features and commands are constrained in their ability to execute.
This command uses the AST parser to scan for as many known issues as possible and gives a comprehensive report for concerns found.

Detected Issues:
- Custom Object creation using PSCustomObject
- Calling methods on untrusted types
- Converting to an untrusted type
- Using Add-Type to load anything but trusted libraries
- Using New-Object to instantiate an untrusted type
- Assigning Values to properties*

*This detection will likely have a large rate of false positives, due to inability to detect datatype of the object, the property of which is being set.
Generally, assigning values to the properties of PSObjects is fine.

Note:
Many of the detections make allowances for "whitelisted types".
In CLM, access to most types is constrained, except for a few, known to be trustworthy types.
To get a full list of the constraints and what types are allowed, see the documentation:

https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_language_modes?view=powershell-7.1#constrained-language-constrained-language

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem C:\Scripts | Test-PSMDClmCompatibility
```

Scans each file in C:\Scripts and returns any issues that might occur in CLM.

## PARAMETERS

### -Path
Path to the scriptfile to scan.

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

[https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_language_modes?view=powershell-7.1#constrained-language-constrained-language](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_language_modes?view=powershell-7.1#constrained-language-constrained-language)

