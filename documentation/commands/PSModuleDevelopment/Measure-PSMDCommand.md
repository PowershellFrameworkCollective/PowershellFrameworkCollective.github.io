---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Measure-PSMDCommand

## SYNOPSIS
Measures command performance with consecutive tests.

## SYNTAX

### Script
```
Measure-PSMDCommand -ScriptBlock <ScriptBlock> [-Iterations <Int32>] [<CommonParameters>]
```

### Set
```
Measure-PSMDCommand [-Iterations <Int32>] -TestSet <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
This function measures the performance of a scriptblock many consective times.

Warning: Running a command repeatedly may not yield reliable information, since repeated executions may benefit from caching or other performance enhancing features, depending on the script content.
This is best suited for measuring the performance of tasks that will later be run repeatedly as well.
It also is useful for mitigating local performance fluctuations when comparing performances.

## EXAMPLES

### EXAMPLE 1
```
Measure-PSMDCommand -ScriptBlock { dir \\Server\share } -Iterations 100
```

This tries to use Get-ChildItem on a remote directory 100 consecutive times, then measures performance and reports common performance indicators (Average duration, Maximum, Minimum, Total)

## PARAMETERS

### -ScriptBlock
The scriptblock whose performance is to be measure.

```yaml
Type: ScriptBlock
Parameter Sets: Script
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Iterations
How many times should this performance test be repeated.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestSet
Accepts a hashtable, mapping a name to a specific scriptblock to measure.
This will generate a result grading the performance of the various sets offered.

```yaml
Type: Hashtable
Parameter Sets: Set
Aliases:

Required: True
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
