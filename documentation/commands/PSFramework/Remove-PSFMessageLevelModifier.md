---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Remove-PSFMessageLevelModifier

## SYNOPSIS
Removes a message level modifier.

## SYNTAX

```
Remove-PSFMessageLevelModifier [[-Name] <String[]>] [[-Modifier] <MessageLevelModifier[]>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Removes a message level modifier.

Message Level Modifiers can be created by using New-PSFMessageLevelModifier.
They are used to emphasize or deemphasize messages, in order to help with debugging.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFMessageLevelModifier | Remove-PSFMessageLevelModifier
```

Removes all message level modifiers, restoring everything to their default levels.

### EXAMPLE 2
```
Remove-PSFMessageLevelModifier -Name "mymodule.foo"
```

Removes the message level modifier named "mymodule.foo"

## PARAMETERS

### -Name
Name of the message level modifier to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Modifier
The actual modifier to remove, as returned by Get-PSFMessageLevelModifier.

```yaml
Type: MessageLevelModifier[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
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
