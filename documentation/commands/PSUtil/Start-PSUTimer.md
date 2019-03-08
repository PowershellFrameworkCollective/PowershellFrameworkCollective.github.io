---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Start-PSUTimer

## SYNOPSIS
Creates a timer that will alarm the user after it has expired.

## SYNTAX

```
Start-PSUTimer [-Duration] <DateTimeParameter> [-Message] <Object> [-NoProgress] [-AlarmInterval <Int32>]
 [-AlarmCount <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Creates a timer that will alarm the user after it has expired.
Provides both visual and sound warnings.
Also provides a progress bar with a time remaining display.

## EXAMPLES

### EXAMPLE 1
```
timer 170 Tea
```

After 170 Duration give warning that the tea is ready.

## PARAMETERS

### -Duration
The time to wait.

```yaml
Type: DateTimeParameter
Parameter Sets: (All)
Aliases: Seconds

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
What to wait for.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoProgress
Disables progress bar.

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

### -AlarmInterval
In what time interval to write warnings and send sound.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 250
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlarmCount
How often to give warning.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 25
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
