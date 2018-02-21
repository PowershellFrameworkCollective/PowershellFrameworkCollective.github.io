---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Measure-PSMDCommandEx

## SYNOPSIS
Measures command performance with consecutive tests.

## SYNTAX

```
Measure-PSMDCommandEx [-ScriptBlock <ScriptBlock>] [-Iterations <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function measures the performance of a scriptblock many consective times.

Warning: Running a command repeatedly may not yield reliable information, since repeated executions may benefit from caching or other performance enhancing features, depending on the script content.
This is best suited for measuring the performance of tasks that will later be run repeatedly as well.
It also is useful for mitigating local performance fluctuations when comparing performances.

PARAMETER ScriptBlock
The scriptblock whose performance is to be measure.

PARAMETER Iterations
How many times should this performance test be repeated.

## EXAMPLES

### EXAMPLE 1
```
Measure-PSMDCommandEx -ScriptBlock { dir \\Server\share } -Iterations 100
```

This tries to use Get-ChildItem on a remote directory 100 consecutive times, then measures performance and reports common performance indicators (Average duration, Maximum, Minimum, Total)

## PARAMETERS

### -Iterations
How many times should this performance test be repeated.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
The scriptblock whose performance is to be measure.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Supported Interfaces:
------------------------

Author:       Friedrich Weinmann
Company:      die netzwerker Computernetze GmbH
Created:      06.07.2016
LastChanged:  06.11.2016
Version:      1.1

## RELATED LINKS

[Link to Website.]()

