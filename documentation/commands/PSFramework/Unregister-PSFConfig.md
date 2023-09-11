---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Unregister-PSFConfig

## SYNOPSIS
Removes registered configuration settings.

## SYNTAX

### Pipeline (Default)
```
Unregister-PSFConfig [-ConfigurationItem <Config[]>] [-PersistedItem <PersistedConfig[]>]
 [-FullName <String[]>] [-Scope <ConfigScope>] [<CommonParameters>]
```

### Module
```
Unregister-PSFConfig -Module <String> [-Name <String>] [-Scope <ConfigScope>] [<CommonParameters>]
```

## DESCRIPTION
Removes registered configuration settings.
This function can be used to remove settings that have been persisted for either user or computer.
It can also remove persisted settings provided via Environment variable, but only for the current process (so new child-processes will no longer inherit them)

Note: This command has no effect on configuration settings currently in memory.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFConfig | Unregister-PSFConfig
```

Completely removes all registered configurations currently loaded in memory.
In most cases, this will mean removing all registered configurations.

### EXAMPLE 2
```
Unregister-PSFConfig -Scope SystemDefault -FullName 'MyModule.Path.DefaultExport'
```

Unregisters the setting 'MyModule.Path.DefaultExport' from the list of computer-wide defaults.
Note: Changing system wide settings requires running the console with elevation.

### EXAMPLE 3
```
Unregister-PSFConfig -Module MyModule
```

Unregisters all configuration settings for the module MyModule.

## PARAMETERS

### -ConfigurationItem
A configuration object as returned by Get-PSFConfig.

```yaml
Type: Config[]
Parameter Sets: Pipeline
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PersistedItem
A configuration object as returned by Get-PSFConfig -Persisted.
Objects provided this way ignore the Scope parameter - they are unregistered from where they were found.

```yaml
Type: PersistedConfig[]
Parameter Sets: Pipeline
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FullName
The full name of the configuration setting to purge.

```yaml
Type: String[]
Parameter Sets: Pipeline
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Module
The module, amongst which settings should be unregistered.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the setting to unregister.
For use together with the module parameter, to limit the amount of settings that are unregistered.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Settings can be set to either default or enforced, for user or the entire computer.
They can also be persisted via files under appdata, localappdata or programmdata.
https://psframework.org/documentation/documents/psframework/configuration/persistence-location.html

By default, only DefaultSettings for the user are unregistered.
Use this parameter to choose the actual scope for the command to process.

```yaml
Type: ConfigScope
Parameter Sets: (All)
Aliases:
Accepted values: UserDefault, UserMandatory, SystemDefault, SystemMandatory, FileUserLocal, FileUserShared, FileSystem, Environment, EnvironmentSimple

Required: False
Position: Named
Default value: UserDefault
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
