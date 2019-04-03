---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Select-PSUFunctionCode

## SYNOPSIS
Function that shows you the definition of a function and allows you to select lines to copy to your clipboard.

## SYNTAX

### Default (Default)
```
Select-PSUFunctionCode [-Function] <String[]> [-NoTrim] [-EnableException] [<CommonParameters>]
```

### NoWait
```
Select-PSUFunctionCode [-Function] <String[]> [-NoWait] [-NoTrim] [-EnableException] [<CommonParameters>]
```

### PassThru
```
Select-PSUFunctionCode [-Function] <String[]> [-PassThru] [-NoTrim] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Function that shows you the definition of a function and allows you to select lines to copy to your clipboard.
After running this command you will see a GridView pop up.
Select as many lines of code as you would like and select
ok to copy them to your clipboard.

## EXAMPLES

### EXAMPLE 1
```
Select-PSUFunctionCode -function 'Start-PSUTimer'
```

This will open up the code for the function Start-PSUTimer in a GridView window.

### EXAMPLE 2
```
Get-Command timer | Select-PSUFunctionCode
```

You can also pipe functions in.

## PARAMETERS

### -Function
A description of the Function parameter.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -NoWait
Shows function code in gridview and returns control without waiting for the window to close

```yaml
Type: SwitchParameter
Parameter Sets: NoWait
Aliases: w

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Presents input command(s) in gridview, selected lines (if any) get returned as output

```yaml
Type: SwitchParameter
Parameter Sets: PassThru
Aliases: p

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoTrim
If enabled, the white space will not be trimmed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: t

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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
Author: Andrew Pla

## RELATED LINKS
