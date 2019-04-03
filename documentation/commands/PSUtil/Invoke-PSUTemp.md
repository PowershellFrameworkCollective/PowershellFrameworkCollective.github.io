---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Invoke-PSUTemp

## SYNOPSIS
Moves the current location to a temp directory.

## SYNTAX

```
Invoke-PSUTemp [-Get] [<CommonParameters>]
```

## DESCRIPTION
Moves the current location to a temp directory.

The path returned can be set by configuring the 'psutil.path.temp' configuration.
E.g.:
Set-PSFConfig "psutil.path.temp" "D:\temp\_Dump"

If this configuration is not set, it will check the following locations and return the first one found:
C:\Temp
D:\Temp
E:\Temp
C:\Service
$env:temp

## EXAMPLES

### EXAMPLE 1
```
Invoke-PSUTemp
```

Moves to the temporary directory.

## PARAMETERS

### -Get
Alias: g
Rather than move to the directory, return its path.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: g

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
