---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Restart-PSMDShell

## SYNOPSIS
A swift way to restart the PowerShell console.

## SYNTAX

```
Restart-PSMDShell [-NoExit] [-Admin] [-NoProfile] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
A swift way to restart the PowerShell console.
- Allows increasing elevation
- Allows keeping the current process, thus in effect adding a new PowerShell process

## EXAMPLES

### EXAMPLE 1
```
Restart-PSMDShell
```

Restarts the current PowerShell process.

### EXAMPLE 2
```
Restart-PSMDShell -Admin -NoExit
```

Creates a new PowerShell process, run with elevation, while keeping the current console around.

## PARAMETERS

### -NoExit
The current console will not terminate.

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

### -Admin
The new PowerShell process will be run as admin.

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

### -NoProfile
The new PowerShell process will not load its profile.

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
