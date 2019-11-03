---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Unregister-PSFCallback

## SYNOPSIS
Removes a callback from the list of registered callbacks.

## SYNTAX

### Name (Default)
```
Unregister-PSFCallback -Name <String[]> [<CommonParameters>]
```

### Object
```
Unregister-PSFCallback -Callback <Callback[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a callback from the list of registered callbacks.

## EXAMPLES

### EXAMPLE 1
```
Unregister-PSFCallback -Name 'MyModule.Configuration'
```

Unregisters the 'MyModule.Configuration' callback script.

### EXAMPLE 2
```
Get-PSFCallback | Unregister-PSFCallback
```

Removes all callback scripts applicable to the current runspace.

## PARAMETERS

### -Name
The name of the callback to remove.
Does NOT support wildcards.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Callback
A full callback object to remove.
Use Get-PSFCallback to get the list of relevant callback objects.

```yaml
Type: Callback[]
Parameter Sets: Object
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
