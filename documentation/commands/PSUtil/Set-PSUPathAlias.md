---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUPathAlias

## SYNOPSIS
Used to create an an alias that sets your location to the path you specify.

## SYNTAX

```
Set-PSUPathAlias [-Alias] <String> [-Path] <String> [-Register] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
A detailed description of the Set-PSUPathAlias function.

## EXAMPLES

### EXAMPLE 1
```
Set-PSUPathAlias -Alias 'work' -Path 'C:\work'
```

Creates an alias to Set-PSUPath that will set the location to 'c:\work'

### EXAMPLE 2
```
Set-PSUPathAlias -Alias 'repos' -Path 'C:\repos' -Register
```

Creates an alias for repos and registers the setting so that it will persist between sessions.

## PARAMETERS

### -Alias
Name of the Alias that will be created for Set-PSUPath.
Set-PSU Path detects the alias that called it and then finds the corresponding PSFConfig entry for it.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
This is the path that you want your location to change to when the alias is called.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Causes PSUtil to remember the alias across sessions.
For more advanced options, see Register-PSFConfig.

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

## RELATED LINKS
