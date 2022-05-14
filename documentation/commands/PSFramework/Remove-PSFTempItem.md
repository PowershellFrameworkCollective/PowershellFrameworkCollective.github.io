---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Remove-PSFTempItem

## SYNOPSIS
Removes temporary items.

## SYNTAX

### targeted (Default)
```
Remove-PSFTempItem -Name <String> -ModuleName <String> [<CommonParameters>]
```

### expired
```
Remove-PSFTempItem [-ClearExpired] [<CommonParameters>]
```

## DESCRIPTION
Removes temporary items.
This not only removes them from memory, but also invokes the item's deletion logic, removing temporary files, deleting temporary user accounts, etc.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSFTempItem -ClearExpired
```

Globally removes all temporary items that have expired.

### EXAMPLE 2
```
Get-PSFTempItem | Remove-PSFTempItem
```

Remove ALL temporary items, irrespective of whether they are still needed or not.

### EXAMPLE 3
```
Remove-PSFTempItem -Name configFile -Module FWManager
```

Removes the temp item "configFile" of the module "FWManager"

### EXAMPLE 4
```
Remove-PSFTempItem -Name *beer* -Module Fridge
```

Removes all temporary items containing the word "beer" that are associated with the module "Fridge".
Try not to get too drunk.

## PARAMETERS

### -Name
Name of the temporary item to remove.

```yaml
Type: String
Parameter Sets: targeted
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ModuleName
Name of the module to filter by.

```yaml
Type: String
Parameter Sets: targeted
Aliases: Module

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ClearExpired
Globally remove all temporary items that have expired.

```yaml
Type: SwitchParameter
Parameter Sets: expired
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
