---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Remove-PSFAlias

## SYNOPSIS
Removes an alias from the global scope.

## SYNTAX

```
Remove-PSFAlias [-Name] <String[]> [-Force] [<CommonParameters>]
```

## DESCRIPTION
Removes an alias from the global* scope.
Please note that this always affects the global scope and should not be used lightly.
This has the potential to break code that does not comply with PowerShell best practices and relies on the use of aliases.

Refuses to delete constant aliases.
Requires the '-Force' parameter to delete ReadOnly aliases.

*This includes aliases exported by modules.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSFAlias -Name 'grep'
```

Removes the global alias 'grep'

### EXAMPLE 2
```
Remove-PSFAlias -Name 'select' -Force
```

Removes the default alias 'select'

## PARAMETERS

### -Name
The name of the alias to remove.

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

### -Force
Enforce removal of aliases.
Required to remove ReadOnly aliases (including default aliases such as "select" or "group").

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
