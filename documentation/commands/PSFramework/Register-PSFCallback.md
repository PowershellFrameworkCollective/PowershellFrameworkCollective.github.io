---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFCallback

## SYNOPSIS
Registers a scriptblock to execute when a command calls Invoke-PSFCallback.

## SYNTAX

```
Register-PSFCallback [-Name] <String> [-ModuleName] <String> [-CommandName] <String>
 [-ScriptBlock] <ScriptBlock> [[-Scope] <String>] [-BreakAffinity] [<CommonParameters>]
```

## DESCRIPTION
Registers a scriptblock to execute when a command calls Invoke-PSFCallback.
The basic concept of this feature is for a module to offer a registration point,
where foreign modules - even those unknown to the implementing module - can register
scriptblocks as delegates.
These will then be executed in the implementing module's commands,
where those call Invoke-PSFCallback.

When designing a callback, keep in mind, that it will be executed on all applicable commmands.
A major aspect to consider here is the execution time, as this will get added on top of each applicable execution.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFCallback -Name 'MyModule.Configuration' -ModuleName 'DomainManagement' -CommandName '*' -ScriptBlock $ScriptBlock
```

Defines a callback named 'MyModule.Configuration'.
This callback scriptblock will be triggered from all commands of the DomainManagement module,
however only from the current runspace.

## PARAMETERS

### -Name
Name of the callback.
Must be unique.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ModuleName
The name of the module from which Invoke-PSFCallback is being called.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -CommandName
Name of the command calling Invoke-PSFCallback.
Allows wildcard matching.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ScriptBlock
The scriptblock to execute as callback action.
This scriptblock will receive a single argument: A hashtable.
That hashtable will contain the following keys:
- Command:        Name of the command calling Invoke-PSFCallback
- ModuleName:     Name of the module the command calling Invoke-PSFCallback is part of.
- CallerFunction: Name of the command calling the command calling Invoke-PSFCallback
- CallerModule:   Name of the module of the command calling the command calling Invoke-PSFCallback
- Data:           Additional data specified by the command calling Invoke-PSFCallback

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Scope
Whether the callback script is valid in this runspace only (default) or process-wide.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: CurrentRunspace
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -BreakAffinity
By default, the callback scriptblock is being executed in the runspace that defined it.
Setting this parameter, the callback scriptblock is instead being executed in whatever
runspace it is being triggered from.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
