---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFCallback

## SYNOPSIS
Returns a list of callback scripts.

## SYNTAX

```
Get-PSFCallback [[-Name] <String[]>] [-All] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of callback scripts.
Use Register-PSFCallback to register new callback scripts.
Use Unregister-PSFCallback to remove callback scripts.
Use Invoke-PSFCallback within a function of your module to execute all registered callback scripts that apply.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFCallback
```

Returns all callback scripts relevant to the current runspace.

### EXAMPLE 2
```
Get-PSFCallback -All
```

Returns all callback scripts in the entire process.

### EXAMPLE 3
```
Get-PSFCallback -Name MyModule.Configuration
```

Returns the callback script named 'MyModule.Configuration'

## PARAMETERS

### -Name
The name to filter by.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -All
Return all callback scripts, even those specific to other runspaces.

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

### PSFramework.FlowControl.Callback
## NOTES

## RELATED LINKS
