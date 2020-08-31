---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFLoggingProviderInstance

## SYNOPSIS
Returns a list of the enabled logging provider instances.

## SYNTAX

```
Get-PSFLoggingProviderInstance [[-ProviderName] <String>] [[-Name] <String>] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of the enabled logging provider instances.
Those are used to log messages to whatever system they are designed to log to.

PSFramework ships with a few default logging providers.
Custom logging destinations can be created by implementing your own, custom provider and registering it using Register-PSFLoggingProvider.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFLoggingProviderInstance
```

Returns all enabled logging provider instances.

### EXAMPLE 2
```
Get-PSFLoggingProviderInstance -ProviderName logfile -Force
```

Returns all logging provider instances - enabled or not - of the logfile provider

## PARAMETERS

### -ProviderName
Default: '*'
The name of the provider the instance is an instance of.

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

### -Name
Default: '*'
The name of the instance to filter by.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Enables returning disabled instances.

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

### PSFramework.Logging.Provider
## NOTES

## RELATED LINKS
