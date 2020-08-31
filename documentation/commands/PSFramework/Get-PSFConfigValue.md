---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFConfigValue

## SYNOPSIS
Returns the configuration value stored under the specified name.

## SYNTAX

```
Get-PSFConfigValue [-FullName] <String> [-Fallback <Object>] [-NotNull] [<CommonParameters>]
```

## DESCRIPTION
Returns the configuration value stored under the specified name.
It requires the full name (\<Module\>.\<Name\>) and is usually only called by functions.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFConfigValue -FullName 'System.MailServer'
```

Returns the configured value that was assigned to the key 'System.MailServer'

### EXAMPLE 2
```
Get-PSFConfigValue -FullName 'Default.CoffeeMilk' -Fallback 0
```

Returns the configured value for 'Default.CoffeeMilk'.
If no such value is configured, it returns '0' instead.

## PARAMETERS

### -FullName
The full name (\<Module\>.\<Name\>) of the configured value to return.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fallback
A fallback value to use, if no value was registered to a specific configuration element.
This basically is a default value that only applies on a "per call" basis, rather than a system-wide default.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NotNull
By default, this function returns null if one tries to retrieve the value from either a Configuration that does not exist or a Configuration whose value was set to null.
However, sometimes it may be important that some value was returned.
By specifying this parameter, the function will throw an error if no value was found at all.

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
