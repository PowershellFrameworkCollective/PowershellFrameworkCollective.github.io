---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Get-PSUCalendarWeek

## SYNOPSIS
Calculates the calendar week of the specified date.

## SYNTAX

```
Get-PSUCalendarWeek [[-Date] <DateTimeParameter>] [[-FirstDay] <DayOfWeek>] [[-WeekRule] <CalendarWeekRule>]
 [[-Culture] <CultureInfo>] [<CommonParameters>]
```

## DESCRIPTION
Calculates the calendar week of the specified date.
Can be customized to fit the calendar rules of a given culture.

## EXAMPLES

### EXAMPLE 1
```
Get-PSUCalendarWeek
```

Gets the current calendar week

## PARAMETERS

### -Date
The date for which to process the calendar week.
Defaults to the current time and date.

```yaml
Type: DateTimeParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Get-Date)
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstDay
Which day is considered the first day of the week.
Defaults to the current or selected culture.

```yaml
Type: DayOfWeek
Parameter Sets: (All)
Aliases:
Accepted values: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WeekRule
The rule by which the first week of the year is determined.
Defaults to the current or selected culture.

```yaml
Type: CalendarWeekRule
Parameter Sets: (All)
Aliases:
Accepted values: FirstDay, FirstFullWeek, FirstFourDayWeek

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Culture
The culture to use when determining the calendarweek of the specified date.
Defaults to the current culture.

```yaml
Type: CultureInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-Culture)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
