---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Export-PSFConfig

## SYNOPSIS
Exports configuration items to a Json file.

## SYNTAX

### FullName (Default)
```
Export-PSFConfig [-FullName] <String> [-OutPath] <String> [-SkipUnchanged] [-EnableException]
 [<CommonParameters>]
```

### Config
```
Export-PSFConfig [-Config] <Config[]> [-OutPath] <String> [-SkipUnchanged] [-EnableException]
 [<CommonParameters>]
```

### Module
```
Export-PSFConfig [-Module] <String> [[-Name] <String>] [-OutPath] <String> [-SkipUnchanged] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Exports configuration items to a Json file.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFConfig | Export-PSFConfig -OutPath '~/export.json'
```

Exports all current settings to json.

### EXAMPLE 2
```
Export-PSFConfig -Module MyModule -OutPath '~/export.json' -SkipUnchanged
```

Exports all settings of the module 'MyModule' that are no longer the original default values to json.

## PARAMETERS

### -Config
The configuration object(s) to export.

```yaml
Type: Config[]
Parameter Sets: Config
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FullName
Select the configuration objects to export by filtering by their full name.

```yaml
Type: String
Parameter Sets: FullName
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Module
Select the configuration objects to export by filtering by their module name.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Select the configuration objects to export by filtering by their name.

```yaml
Type: String
Parameter Sets: Module
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
The path (filename included) to export to.
Will fail if the folder does not exist, will overwrite the file if it exists.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipUnchanged
If set, configuration objects whose value was not changed from its original value will not be exported.
(Note: Settings that were updated with the same value as the original default will still be considered changed)

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
