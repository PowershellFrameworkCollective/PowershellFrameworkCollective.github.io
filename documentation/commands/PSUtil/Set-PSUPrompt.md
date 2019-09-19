---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUPrompt

## SYNOPSIS
Applies one of the pre-defined prompts.

## SYNTAX

```
Set-PSUPrompt [-Prompt] <String> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Applies one of the pre-defined prompts.

## EXAMPLES

### EXAMPLE 1
```
Set-PSUPrompt -Prompt fred
```

Applies the prompt fred uses.

## PARAMETERS

### -Prompt
The prompt to apply

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

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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
