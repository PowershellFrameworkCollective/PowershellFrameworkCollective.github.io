---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUPath

## SYNOPSIS
Detects the alias that called it and sets the location to the corresponding path found in the configuration system.

## SYNTAX

```
Set-PSUPath [[-Alias] <String>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Detects the alias that called it and sets the location to the corresponding path.
This function will normally be called using an alias that gets set by using Set-PSUPathAlias.

## EXAMPLES

### EXAMPLE 1
```
Software
```

PS C:\Software\>

In this example 'Software' is an alias for Set-PSUPath that was created by using Set-PSUPathAlias.
Set-PSUPath detected that 'Software' was the alias that called it and then sends it to the path.
It receives the path from Get-PSUPathAlias 'software'

## PARAMETERS

### -Alias
This is the name of the alias that called the command.
      Default Value is $MyInvocation.InvocationName and is detected automatically

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $MyInvocation.InvocationName
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
