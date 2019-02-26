---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Import-PSFConfig

## SYNOPSIS
Imports a json configuration file into the configuration system.

## SYNTAX

### Path (Default)
```
Import-PSFConfig -Path <String[]> [-Schema <String>] [-IncludeFilter <String[]>] [-ExcludeFilter <String[]>]
 [-Peek] [-AllowDelete] [-EnableException] [<CommonParameters>]
```

### ModuleName
```
Import-PSFConfig -ModuleName <String> [-ModuleVersion <Int32>] [-Scope <ConfigScope>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Imports a json configuration file into the configuration system.

## EXAMPLES

### EXAMPLE 1
```
Import-PSFConfig -Path '.\config.json'
```

Imports the configuration stored in '.\config.json'

### EXAMPLE 2
```
Import-PSFConfig -ModuleName mymodule
```

Imports all the module specific settings that have been persisted in any of the default file system paths.

## PARAMETERS

### -Path
The path to the json file to import.

```yaml
Type: String[]
Parameter Sets: Path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ModuleName
Import configuration items specific to a module from the default configuration paths.

```yaml
Type: String
Parameter Sets: ModuleName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleVersion
The configuration version of the module-settings to load.

```yaml
Type: Int32
Parameter Sets: ModuleName
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Where to import the module specific configuration items form.
Only file-based scopes are supported for this.
By default, all locations are queried, with user settings beating system settings.

```yaml
Type: ConfigScope
Parameter Sets: ModuleName
Aliases:
Accepted values: UserDefault, UserMandatory, SystemDefault, SystemMandatory, FileUserLocal, FileUserShared, FileSystem

Required: False
Position: Named
Default value: FileUserLocal, FileUserShared, FileSystem
Accept pipeline input: False
Accept wildcard characters: False
```

### -Schema
The configuration schema to use for import.
Use Register-PSFConfigSchema to extend the way input content can be laid out.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeFilter
If specified, only elements with names that are similar (-like) to names in this list will be imported.

```yaml
Type: String[]
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeFilter
Elements that are similar (-like) to names in this list will not be imported.

```yaml
Type: String[]
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Peek
Rather than applying the setting, return the configuration items that would have been applied.

```yaml
Type: SwitchParameter
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowDelete
Configurations that have been imported will be flagged as deletable.
This allows to purge them at a later time using Remove-PSFConfig.

```yaml
Type: SwitchParameter
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: False
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
