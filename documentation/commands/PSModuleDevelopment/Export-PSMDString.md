---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Export-PSMDString

## SYNOPSIS
Parses a module that uses the PSFramework localization feature for strings and their value.

## SYNTAX

```
Export-PSMDString [-ModuleRoot] <String> [<CommonParameters>]
```

## DESCRIPTION
Parses a module that uses the PSFramework localization feature for strings and their value.
This command can be used to generate and update the language files used by the module.
It is also used in automatic tests, ensuring no abandoned string has been left behind and no key is unused.

## EXAMPLES

### EXAMPLE 1
```
Export-PSMDString -ModuleRoot 'C:\Code\Github\MyModuleProject\MyModule'
```

Generates the strings data for the MyModule module.

## PARAMETERS

### -ModuleRoot
The root of the module to process.
Must be the root folder where the psd1 file is stored in.

```yaml
Type: String
Parameter Sets: (All)
Aliases: ModuleBase

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
