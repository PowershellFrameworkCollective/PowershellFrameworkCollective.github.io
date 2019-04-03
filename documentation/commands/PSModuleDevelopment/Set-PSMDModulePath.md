---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDModulePath

## SYNOPSIS
Sets the path of the module currently being developed.

## SYNTAX

### Module
```
Set-PSMDModulePath -Module <PSModuleInfo> [-Register] [-EnableException] [<CommonParameters>]
```

### Path
```
Set-PSMDModulePath -Path <String> [-Register] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Sets the path of the module currently being developed.
This is used by several utility commands in order to not require any path input.

This is a wrapper around the psframework configuration system, the same action can be taken by running this command:
Set-PSFConfig -Module PSModuleDevelopment -Name "Module.Path" -Value $Path

## EXAMPLES

### EXAMPLE 1
```
Set-PSMDModulePath -Path "C:\github\dbatools"
```

Sets the current module path to "C:\github\dbatools"

### EXAMPLE 2
```
Set-PSMDModulePath -Path "C:\github\dbatools" -Register
```

Sets the current module path to "C:\github\dbatools"
Then stores the setting in registry, causing it to be persisted acros multiple sessions.

## PARAMETERS

### -Module
The module, the path of which to register.

```yaml
Type: PSModuleInfo
Parameter Sets: Module
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
The path to set as currently developed module.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Register the specified path, to have it persist across sessions

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
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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
