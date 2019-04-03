---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Remove-PSUPathAlias

## SYNOPSIS
Removes a path alias fromm the configuration system.

## SYNTAX

```
Remove-PSUPathAlias [[-Alias] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Removes a path alias from the configuration system using Unregister-PSFConfig.
Note: This command has no effect on configuration setings currently in memory.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSUPathAlias -Alias work
```

Removes the path alias named work from the configuration system.

## PARAMETERS

### -Alias
The name of the Alias that you want to remove from the configuration system.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
