---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFPath

## SYNOPSIS
Configures or updates a path under a name.

## SYNTAX

### Default (Default)
```
Set-PSFPath -Name <String> -Path <String> [<CommonParameters>]
```

### Register
```
Set-PSFPath -Name <String> -Path <String> [-Register] [-Scope <ConfigScope>] [<CommonParameters>]
```

## DESCRIPTION
Configures or updates a path under a name.
The path can be persisted using the "-Register" command.
Paths setup like this can be retrieved using Get-PSFPath.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFPath -Name 'temp' -Path 'C:\temp'
```

Configures C:\temp as the current temp path.
(does not override $env:temp !)

## PARAMETERS

### -Name
Name the path should be stored under.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path that should be returned under the name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Registering a path in order for it to persist across sessions.

```yaml
Type: SwitchParameter
Parameter Sets: Register
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
The configuration scope it should be registered under.
Defaults to UserDefault.
Configuration scopes are the default locations configurations are being stored at.
For more details see:
https://psframework.org/documentation/documents/psframework/configuration/persistence-location.html

```yaml
Type: ConfigScope
Parameter Sets: Register
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
