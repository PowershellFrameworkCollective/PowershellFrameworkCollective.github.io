---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFTaskEngineTask

## SYNOPSIS
Allows scheduling PowerShell tasks, that are perfomed in the background.

## SYNTAX

### Once
```
Register-PSFTaskEngineTask -Name <String> [-Description <String>] -ScriptBlock <ScriptBlock> [-Once]
 [-Delay <TimeSpanParameter>] [-Priority <Priority>] [-ResetTask] [-EnableException] [<CommonParameters>]
```

### Repeating
```
Register-PSFTaskEngineTask -Name <String> [-Description <String>] -ScriptBlock <ScriptBlock>
 -Interval <TimeSpanParameter> [-Delay <TimeSpanParameter>] [-Priority <Priority>] [-ResetTask]
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Allows scheduling PowerShell tasks, that are perfomed in the background.

All scriptblocks scheduled like this will be performed on a separate runspace.
None of the scriptblocks will affect the main session (so you cannot manipulate variables, etc.)

This system is designed for two use-cases:
- Reducing module import time by off-loading expensive one-time actions (such as building a cache) in the background
- Scheduling periodic script executions that should occur while the process is running (e.g.: continuous maintenance, cache updates, ...)

It also avoids overloading the client computer by executing too many tasks at the same time, as multiple modules running code in the background might.
Instead tasks that are due simultaneously are processed by priority.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFTaskEngineTask -Name 'mymodule.buildcache' -ScriptBlock $ScriptBlock -Once -Description 'Builds the object cache used by the mymodule module'
```

Registers the task contained in $ScriptBlock under the name 'mymodule.buildcache' to execute once at the system's earliest convenience in a medium (default) priority.

### EXAMPLE 2
```
Register-PSFTaskEngineTask -Name 'mymodule.maintenance' -ScriptBlock $ScriptBlock -Interval "00:05:00" -Delay "00:01:00" -Priority Critical -Description 'Performs critical system maintenance in order for the mymodule module to function'
```

Registers the task contained in $ScriptBlock under the name 'mymodule.maintenance'
- Sets it to execute every 5 minutes
- Sets it to wait for 1 minute after registration before starting the first execution
- Sets it to priority "Critical", ensuring it takes precedence over most other tasks.

## PARAMETERS

### -Name
The name of the task.
Must be unique, otherwise it will update the existing task.

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

### -Description
Description of the task.
Helps documenting the task and what it is supposed to be doing.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
The task/scriptblock that should be performed as a background task.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Once
Whether the task should be performed only once.

```yaml
Type: SwitchParameter
Parameter Sets: Once
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Interval
The interval at which the task should be repeated.

```yaml
Type: TimeSpanParameter
Parameter Sets: Repeating
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Delay
How far after the initial registration should the task script wait before processing this.
This can be used to delay background stuff that should not content with items that would be good to have as part of the module import.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
How important is this task?
If multiple tasks are due at the same maintenance cycle, the more critical one will be processed first.

```yaml
Type: Priority
Parameter Sets: (All)
Aliases:
Accepted values: Trivial, Low, Medium, High, Critical

Required: False
Position: Named
Default value: Medium
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResetTask
If the task already exists, it will be reset by setting this parameter (this switch is ignored when creating new tasks).
This allows explicitly registering tasks for re-execution, even though they were set to execute once only.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
