---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFConfig

## SYNOPSIS
Registers an existing configuration object in registry.

## SYNTAX

### Default (Default)
```
Register-PSFConfig [[-Config] <Config[]>] [[-FullName] <String[]>] [-Scope <ConfigScope>] [-EnableException]
 [<CommonParameters>]
```

### Name
```
Register-PSFConfig [-Module] <String> [[-Name] <String>] [-Scope <ConfigScope>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Registers an existing configuration object in registry.
This allows simple persisting of settings across powershell consoles.
It also can be used to generate a registry template, which can then be used to create policies.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFConfig psframework.message.* | Register-PSFConfig
```

Retrieves all configuration items that that start with psframework.message.
and registers them in registry for the current user.

### EXAMPLE 2
```
Register-PSFConfig -FullName "psframework.developer.mode.enable" -Scope SystemDefault
```

Retrieves the configuration item "psframework.developer.mode.enable" and registers it in registry as the default setting for all users on this machine.

### EXAMPLE 3
```
Register-PSFConfig -Module MyModule -Scope SystemMandatory
```

Retrieves all configuration items of the module MyModule, then registers them in registry to enforce them for all users on the current system.

## PARAMETERS

### -Config
The configuration object to write to registry.
Can be retrieved using Get-PSFConfig.

```yaml
Type: Config[]
Parameter Sets: Default
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FullName
The full name of the setting to be written to registry.

```yaml
Type: String[]
Parameter Sets: Default
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Module
The name of the module, whose settings should be written to registry.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Default: "*"
Used in conjunction with the -Module parameter to restrict the number of configuration items written to registry.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Default: UserDefault
Who will be affected by this export how?
Current user or all?
Default setting or enforced?
For more information on scopes and what location they correspond to, see:
https://psframework.org/documentation/documents/psframework/configuration/persistence-location.html

Environment variable scopes will only be persisted to the current process, affecting all child processes but not the computer in its entirety.

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

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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
