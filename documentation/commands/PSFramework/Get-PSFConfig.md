---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFConfig

## SYNOPSIS
Retrieves configuration elements by name.

## SYNTAX

### FullName (Default)
```
Get-PSFConfig [[-FullName] <String>] [-Persisted] [-Force] [<CommonParameters>]
```

### Module
```
Get-PSFConfig [[-Name] <String>] [[-Module] <String>] [-Persisted] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Retrieves configuration elements by name.
Can be used to search the existing configuration list.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFConfig 'Mail.To'
```

Retrieves the configuration element for the key "Mail.To"

### EXAMPLE 2
```
Get-PSFConfig -Force
```

Retrieve all configuration elements from all modules, even hidden ones.

### EXAMPLE 3
```
Get-PSFConfig -Persisted
```

Retrieve all persisted settings.

## PARAMETERS

### -FullName
Default: "*"
Search for configurations using the full name

```yaml
Type: String
Parameter Sets: FullName
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Name
Default: "*"
The name of the configuration element(s) to retrieve.
May be any string, supports wildcards.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Module
Default: "*"
Search configuration by module.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Persisted
Rather than retrieving current settings, look for configuration entries that have been persisted on the machine.

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

### -Force
Overrides the default behavior and also displays hidden configuration values.

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

### PSFramework.Configuration.Config
## NOTES

## RELATED LINKS
