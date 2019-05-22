---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Import-PSFLocalizedString

## SYNOPSIS
Imports a set of localized strings from a PowerShell data file.

## SYNTAX

```
Import-PSFLocalizedString [-Path] <String> [-Module] <String> [[-Language] <String>] [<CommonParameters>]
```

## DESCRIPTION
Imports a set of localized strings from a PowerShell data file.
This is used to feed the localized string feature set.
Always import for all languages, do not select by current language - the system handles language selection.

Strings are process wide, so loading additional languages can be offloaded into a background task.

## EXAMPLES

### EXAMPLE 1
```
Import-PSFLocalizedString -Path '$moduleRoot\strings.psd1' -Module 'MyModule'
```

Imports the strings stored in strings.psd1 for the module MyModule as 'en-US' language strings.

## PARAMETERS

### -Path
The path to the psd1 file to import as strings file.

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

### -Module
The module for which to import the strings.

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

### -Language
The language of the specific strings file.
Defaults to en-US.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: En-US
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This command is not safe to expose in a JEA endpoint.
In its need to maintain compatibility it allows for a path for arbitrary code execution.

## RELATED LINKS
