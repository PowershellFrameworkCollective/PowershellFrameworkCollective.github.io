---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFLocalizedString

## SYNOPSIS
Returns the localized strings of a module.

## SYNTAX

### Default (Default)
```
Get-PSFLocalizedString -Module <String> [<CommonParameters>]
```

### Name
```
Get-PSFLocalizedString -Module <String> -Name <String> [<CommonParameters>]
```

## DESCRIPTION
Returns the localized strings of a module.
By default, it creates a variable that has access to each localized string in the module (with string name as propertyname).
Alternatively, by specifying a specific string, that string can instead be returned.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFLocalizedString -Module 'MyModule'
```

Returns an object that can be used to access any localized string.

### EXAMPLE 2
```
Get-PSFLocalizedString -Module 'MyModule' -Name 'ErrorValidation'
```

Returns the string for the module 'MyModule'  that is stored under the 'ErrorValidation'  name.

## PARAMETERS

### -Module
The name of the module to map.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the string to return

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.Localization.LocalStrings
### System.String
## NOTES

## RELATED LINKS
