---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Unregister-PSFMessageColorTransform

## SYNOPSIS
Removes a previously registered message color rule.

## SYNTAX

```
Unregister-PSFMessageColorTransform [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a previously registered message color rule.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFMessageColorTransform | Unregister-PSFMessageColorTransform
```

Clears all message color rules..

## PARAMETERS

### -Name
Name of the rule to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
