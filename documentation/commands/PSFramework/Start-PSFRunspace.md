---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Start-PSFRunspace

## SYNOPSIS
Starts a runspace that was registered to the PSFramework

## SYNTAX

```
Start-PSFRunspace [[-Name] <String[]>] [[-Runspace] <RunspaceContainer[]>] [-NoMessage] [-EnableException]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Starts a runspace that was registered to the PSFramework
Simply registering does not automatically start a given runspace.
Only by executing this function will it take effect.

## EXAMPLES

### EXAMPLE 1
```
Start-PSFRunspace -Name 'mymodule.maintenance'
```

Starts the runspace registered under the name 'mymodule.maintenance'

## PARAMETERS

### -Name
The name of the registered runspace to launch

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Runspace
The runspace to launch.
Returned by Get-PSFRunspace

```yaml
Type: RunspaceContainer[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -NoMessage
Setting this will prevent messages be written to the message / logging system.
This is designed to make the PSFramework not flood the log on each import.

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
