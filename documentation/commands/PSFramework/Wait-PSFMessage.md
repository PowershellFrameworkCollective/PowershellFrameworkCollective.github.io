---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Wait-PSFMessage

## SYNOPSIS
Waits until the PSFramework log queue has been flushed.

## SYNTAX

```
Wait-PSFMessage [[-Timeout] <DateTimeParameter>] [-Terminate] [<CommonParameters>]
```

## DESCRIPTION
Waits until the PSFramework log queue has been flushed.
Also supports ending the logging runspace.

This is designed to explicitly handle script termination for tasks that run in custom hosts that do not properly fire runspace termination events, leading to infinitely hanging tasks.

## EXAMPLES

### EXAMPLE 1
```
Wait-PSFMessage
```

Waits until all pending messages are logged.

### EXAMPLE 2
```
Wait-PSFMessage -Timeout 1m -Terminate
```

Waits up to one minute for all messages to be flushed, then terminates the logging runspace

## PARAMETERS

### -Timeout
Maximum duration for the command to wait until it terminates even if there are messages left.

```yaml
Type: DateTimeParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 5m
Accept pipeline input: False
Accept wildcard characters: False
```

### -Terminate
If this parameter is specified it will terminate the running logging runspace.
Use this if your script will run in a powershell host that does not properly execute termination events.
Danger!!!!
Should never be used in a script that might be called by other scripts, as this might prematurely end logging!

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
