---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Invoke-PSUDesktop

## SYNOPSIS
Function that sets the current console path to the user desktop.

## SYNTAX

```
Invoke-PSUDesktop [[-User] <String>] [-Get] [<CommonParameters>]
```

## DESCRIPTION
Function that sets the current console path to the user desktop.
Uses the current user's desktop by default, but can be set to the desktop of any locally available profile.

## EXAMPLES

### EXAMPLE 1
```
Desktop
```

Sets the current location to the desktop path of the current user.

## PARAMETERS

### -User
Alias: u
Choose which user's desktop path to move to.
Must be available as a local profile for things to work out.

```yaml
Type: String
Parameter Sets: (All)
Aliases: u

Required: False
Position: 1
Default value: $env:USERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -Get
Alias: g
Returns the path, rather than changing the location

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: g

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
