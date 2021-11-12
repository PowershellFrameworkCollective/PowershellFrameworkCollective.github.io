---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFThrottle

## SYNOPSIS
Create a throttle object, used to not exceed a certain rate of executions per time interval.

## SYNTAX

```
New-PSFThrottle [-Interval] <TimeSpanParameter> [-Limit] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Create a throttle object, used to not exceed a certain rate of executions per time interval.
Use this to limit the rate at which you contact throttled APIs / Service Connections.

The returnd object has a GetSlot() method, which will return immediately if slots are available.
If none are, it will wait to return until there are.

This object is threadsafe and can be used from multiple runspaces.
However, it is not guaranteed to be 100% precise with concurrent access, possibly allowing (slight) overbooking.

## EXAMPLES

### EXAMPLE 1
```
New-PSFThrottle -Interval 1m -Limit 60
```

Generates a throttle object that will allow 60 slots/executions every minute.

## PARAMETERS

### -Interval
The time range during which we measure slot/execution limits.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
The number of valid executions within the specified interval.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
