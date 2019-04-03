---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Remove-PSFConfig

## SYNOPSIS
Removes configuration items from memory.

## SYNTAX

### Default
```
Remove-PSFConfig [[-Config] <Config[]>] [[-FullName] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Name
```
Remove-PSFConfig [-Module] <String> [[-Name] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This command removes configuration items from memory.
However, not all settings can just be deleted!
A configuration item must be flagged as deletable.
This can be done using Set-PSFConfig -AllowDelete or Import-PSFConfig -AllowDelete.
Certain schema versions of configuration json may also support defining this in the file.

Limitations to flagging configuration as deletable:
\> Once a configuration item has been initialized, its deletable status is frozen.
  The last time it is possible to change the deletable status is during initialization.
\> A setting that has been set as mandated by policy cannot be removed.

Reason for this limit:
The configuration system is designed for multiple scenarios.
Deleting settings makes sense in some, while in others it is actually detrimental.
Initialization is especially designed for the module scenario, where the module's configuration is its options menu.
In this scenario, having a user deleting settings could lead to broken execution and unintended code paths, that might be at odds with policies defined.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSFConfig -FullName 'Phase1.Step1.Server' -Confirm:$false
```

Deletes the setting 'Phase1.Step1.Server' from memory, assuming it exists and supports deletion.

## PARAMETERS

### -Config
The configuration object to remove from memory.
Can be retrieved using Get-PSFConfig.

```yaml
Type: Config[]
Parameter Sets: Default
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FullName
The full name of the setting to be removed from memory.

```yaml
Type: String[]
Parameter Sets: Default
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Module
The name of the module, whose settings should be removed from memory.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Default: "*"
Used in conjunction with the -Module parameter to restrict the number of configuration items deleted from memory.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: False
Position: 2
Default value: *
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
