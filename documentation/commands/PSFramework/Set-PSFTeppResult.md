---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFTeppResult

## SYNOPSIS
Refreshes the tab completion value cache.

## SYNTAX

```
Set-PSFTeppResult [-TabCompletion] <String> [-Value] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Refreshes the tab completion value cache for the specified completion scriptblock.

Tab Completion scriptblocks can be configured to retrieve values from a dedicated cache.
This allows seamless background refreshes of completion data and eliminates all waits for the user.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFTeppResult -TabCompletion 'MyModule.Computer' -Value (Get-ADComputer -Filter *).Name
```

Stores the names of all computers in AD into the tab completion cache of the completion scriptblock 'MyModule.Computer'

## PARAMETERS

### -TabCompletion
The name of the completion script to set the last results for.

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

### -Value
The values to set.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
