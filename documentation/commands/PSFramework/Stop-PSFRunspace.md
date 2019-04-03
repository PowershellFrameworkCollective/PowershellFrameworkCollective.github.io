---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Stop-PSFRunspace

## SYNOPSIS
Stops a runspace that was registered to the PSFramework

## SYNTAX

```
Stop-PSFRunspace [[-Name] <String[]>] [[-Runspace] <RunspaceContainer[]>] [-EnableException] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Stops a runspace that was registered to the PSFramework
Will not cause errors if the runspace is already halted.

Runspaces may not automatically terminate immediately when calling this function.
Depending on the implementation of the scriptblock, this may in fact take a little time.
If the scriptblock hasn't finished and terminated the runspace in a seemingly time, it will be killed by the system.
This timeout is by default 30 seconds, but can be altered by using the Configuration System.
For example, this line will increase the timeout to 60 seconds:
Set-PSFConfig -FullName PSFramework.Runspace.StopTimeout -Value 60

## EXAMPLES

### EXAMPLE 1
```
Stop-PSFRunspace -Name 'mymodule.maintenance'
```

Stops the runspace registered under the name 'mymodule.maintenance'

## PARAMETERS

### -Name
The name of the registered runspace to stop

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
The runspace to stop.
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
Additional information about the function.

## RELATED LINKS
