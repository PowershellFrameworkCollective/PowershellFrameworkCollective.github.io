---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDDotNetProject

## SYNOPSIS
Wrapper function around 'dotnet new'

## SYNTAX

### Create (Default)
```
New-PSMDDotNetProject [-TemplateName] <String> [-Help] [-Force] [[-Name] <String>] [[-Output] <String>]
 [-Arguments <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### List
```
New-PSMDDotNetProject [[-TemplateName] <String>] [-List] [-Help] [-Force] [-Arguments <String[]>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### Install
```
New-PSMDDotNetProject [-Help] [-Force] -Install <String> [-Arguments <String[]>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Uninstall
```
New-PSMDDotNetProject [-Help] [-Force] -Uninstall <String> [-Arguments <String[]>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function is a wrapper around the dotnet.exe application with the parameter 'new'.
It can be used to create projects from templates, as well as to administrate templates.

## EXAMPLES

### EXAMPLE 1
```
dotnetnew -l
```

Lists all installed templates.

### EXAMPLE 2
```
dotnetnew mvc foo F:\temp\projects\foo -au Windows --no-restore
```

Creates a new MVC project named "foo" in folder "F:\Temp\projects\foo"
- It will set authentication to windows
- It will skip the automatic restore of the project on create

## PARAMETERS

### -TemplateName
The name of the template to create

```yaml
Type: String
Parameter Sets: Create
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: List
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -List
List the existing templates.

```yaml
Type: SwitchParameter
Parameter Sets: List
Aliases: l

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Help
Ask for help / documentation.
Particularly useful when dealing with project types that have a lot of options.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: h

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Overwrite existing files.

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

### -Name
The name of the project to create

```yaml
Type: String
Parameter Sets: Create
Aliases: n

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Output
The folder in which to create it.
Note: This folder will automatically be te root folder of the project.
If this folder doesn't exist yet, it will be created.
When used with -Force, it will automatically purge all contents.

```yaml
Type: String
Parameter Sets: Create
Aliases: o

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Install
Install the specified template from the VS marketplace.

```yaml
Type: String
Parameter Sets: Install
Aliases: i

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Uninstall
Uninstall an installed template.

```yaml
Type: String
Parameter Sets: Uninstall
Aliases: u

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Arguments
Additional arguments to pass to the application.
Generally used for parameters when creating a project from a template.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: a

Required: False
Position: Named
Default value: None
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
