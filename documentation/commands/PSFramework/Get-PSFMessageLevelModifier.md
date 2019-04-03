---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFMessageLevelModifier

## SYNOPSIS
Returns all registered message level modifiers with similar name.

## SYNTAX

```
Get-PSFMessageLevelModifier [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns all registered message level modifiers with similar name.

Message level modifiers are created using New-PSFMessageLevelModifier and allow dynamically modifying the actual message level written by commands.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFMessageLevelModifier
```

Returns all message level filters

### EXAMPLE 2
```
Get-PSFmessageLevelModifier -Name "mymodule.*"
```

Returns all message level filters that start with "mymodule."

## PARAMETERS

### -Name
Default: "*"
A name filter - only commands that are similar to the filter will be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
