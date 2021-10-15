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
Start-PSUTimer [-Duration] <DateTimeParameter> [-Message] <Object> [[-AlarmCount] <Int32>] [-NoProgress]
 [-AlarmInterval <Int32>] [-RandomInterval] [-MinFrequency <Int32>] [-MaxFrequency <Int32>]
 [-DisableScreensaver] [<CommonParameters>]
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

### -AlarmCount
How often to give warning.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 25
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

### -RandomInterval
Randomizes the interval between two signal sounds.

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

### -MinFrequency
The minimum frequency of the beeps.
Must be at least one lower than MaxFrequency.
Increase delta to play random frequency sounds on each beep.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2999
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxFrequency
The maximum frequency of the beeps.
Must be at least one higher than MaxFrequency.
Increase delta to play random frequency sounds on each beep.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 3000
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableScreensaver
Disables the screensaver while the timer is pending.
This only works on Windows and has the command pretend to be a video & backup application, preventing untimely activation of a screensaver.

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
