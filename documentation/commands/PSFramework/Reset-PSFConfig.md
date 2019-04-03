---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Reset-PSFConfig

## SYNOPSIS
Reverts a configuration item to its default value.

## SYNTAX

### Pipeline (Default)
```
Reset-PSFConfig [-ConfigurationItem <Config[]>] [-FullName <String[]>] [-EnableException] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Module
```
Reset-PSFConfig -Module <String> [-Name <String>] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This command can be used to revert a configuration item to the value it was initialized with.
Generally, this amounts to reverting it to its default value.

In order for a reset to be possible, two conditions must be met:
- The setting must have been initialized.
- The setting cannot have been enforced by policy.

## EXAMPLES

### EXAMPLE 1
```
Reset-PSFConfig -Module MyModule
```

Resets all configuration items of the MyModule to default.

### EXAMPLE 2
```
Get-PSFConfig | Reset-PSFConfig
```

Resets ALL configuration items to default.

### EXAMPLE 3
```
Reset-PSFConfig -FullName MyModule.Group.Setting1
```

Resets the configuration item named 'MyModule.Group.Setting1'.

## PARAMETERS

### -ConfigurationItem
A configuration object as returned by Get-PSFConfig.

```yaml
Type: Config[]
Parameter Sets: Pipeline
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FullName
The full name of the setting to reset, offering the maximum of precision.

```yaml
Type: String[]
Parameter Sets: Pipeline
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Module
The name of the module, from which configurations should be reset.
Used in conjunction with the -Name parameter to filter a specific set of items.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Used in conjunction with the -Module parameter to select which settings to reset using wildcard comparison.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
