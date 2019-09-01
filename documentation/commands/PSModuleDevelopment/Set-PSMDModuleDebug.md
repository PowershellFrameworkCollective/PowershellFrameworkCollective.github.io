---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDModuleDebug

## SYNOPSIS
Configures how modules are handled during import of this module.

## SYNTAX

### Name (Default)
```
Set-PSMDModuleDebug [-Name] <String> [-AutoImport] [-DebugMode] [-PreImportAction <ScriptBlock>]
 [-PostImportAction <ScriptBlock>] [-Priority <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### AllImport
```
Set-PSMDModuleDebug [-AllAutoImport] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### NoneImport
```
Set-PSMDModuleDebug [-NoneAutoImport] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This module allows specifying other modules to import during import of this module.
Using the Set-PSMDModuleDebug function it is possible to configure, which module is automatically imported, without having to edit the profile each time.
This import occurs at the end of importing this module, thus setting this module in the profile as automatically imported is recommended.

## EXAMPLES

### EXAMPLE 1
```
Set-PSMDModuleDebug -Name 'cPSNetwork' -AutoImport
```

Configures the module cPSNetwork to automatically import after importing PSModuleDevelopment

### EXAMPLE 2
```
Set-PSMDModuleDebug -Name 'cPSNetwork' -AutoImport -DebugMode
```

Configures the module cPSNetwork to automatically import after importing PSModuleDevelopment using debug mode.

### EXAMPLE 3
```
Set-PSMDModuleDebug -Name 'cPSNetwork' -AutoImport -DebugMode -PreImportAction { Write-Host "Was done before importing" } -PostImportAction { Write-Host "Was done after importing" }
```

Configures the module cPSNetwork to automatically import after importing PSModuleDevelopment using debug mode.
- Running a scriptblock before import
- Running another scriptblock after import

Note: Using Write-Host is generally - but not always - bad practice
Note: Verbose output during module import is generally discouraged (doesn't apply to tests of course)

## PARAMETERS

### -Name
The name of the module to configure for automatic import.
Needs to be an exact match, the first entry found using "Get-Module -ListAvailable" will be imported.

```yaml
Type: String
Parameter Sets: Name
Aliases: n

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -AutoImport
Setting this will cause the module to be automatically imported at the end of importing the PSModuleDevelopment module.
Even when set to false, the configuration can still be maintained and the debug mode enabled.

```yaml
Type: SwitchParameter
Parameter Sets: Name
Aliases: ai

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DebugMode
Setting this will cause the module to create a global variable named "\<ModuleName\>_DebugMode" with value $true during import of PSModuleDevelopment.
Modules configured to use this variable can determine the intended import mode using this variable.

```yaml
Type: SwitchParameter
Parameter Sets: Name
Aliases: dbg

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PreImportAction
Any scriptblock that should run before importing the module.
Only used when importing modules using the "Invoke-ModuleDebug" funtion, as is used for modules set to auto-import.

```yaml
Type: ScriptBlock
Parameter Sets: Name
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostImportAction
Any scriptblock that should run after importing the module.
Only used when importing modules using the "Invoke-ModuleDebug" funtion, as his used for modules set to auto-import.

```yaml
Type: ScriptBlock
Parameter Sets: Name
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
When importing modules in a debugging context, they are imported in the order of their priority.
The lower the number, the sooner it is imported.

```yaml
Type: Int32
Parameter Sets: Name
Aliases:

Required: False
Position: Named
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllAutoImport
Changes all registered modules to automatically import on powershell launch.

```yaml
Type: SwitchParameter
Parameter Sets: AllImport
Aliases: aai

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoneAutoImport
Changes all registered modules to not automatically import on powershell launch.

```yaml
Type: SwitchParameter
Parameter Sets: NoneImport
Aliases: nai

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
