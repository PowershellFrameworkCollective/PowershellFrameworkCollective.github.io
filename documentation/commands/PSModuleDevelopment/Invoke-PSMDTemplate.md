---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Invoke-PSMDTemplate

## SYNOPSIS
Creates a project/file from a template.

## SYNTAX

### NamePath
```
Invoke-PSMDTemplate [-TemplateName] <String> -Path <String> [[-OutPath] <String>] [[-Name] <String>]
 [-Encoding <EncodingParameter>] [-NoFolder] [-Parameters <Hashtable>] [-Raw] [-Force] [-Silent]
 [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### NameStore
```
Invoke-PSMDTemplate [-TemplateName] <String> [-Store <String>] [[-OutPath] <String>] [[-Name] <String>]
 [-Encoding <EncodingParameter>] [-NoFolder] [-Parameters <Hashtable>] [-Raw] [-Force] [-Silent]
 [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Template
```
Invoke-PSMDTemplate -Template <TemplateInfo[]> [[-OutPath] <String>] [[-Name] <String>]
 [-Encoding <EncodingParameter>] [-NoFolder] [-Parameters <Hashtable>] [-Raw] [-Force] [-Silent]
 [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function takes a template and turns it into a finished file&folder structure.
It does so by creating the files and folders stored within, replacing all parameters specified with values provided by the user.

Missing parameters will be prompted for.

## EXAMPLES

### EXAMPLE 1
```
Invoke-PSMDTemplate -TemplateName "module"
```

Creates a project based on the module template in the current folder, asking for all details.

### EXAMPLE 2
```
Invoke-PSMDTemplate -TemplateName "module" -Name "MyModule"
```

Creates a project based on the module template with the name "MyModule"

## PARAMETERS

### -TemplateName
The name of the template to build from.
Warning: This does wildcard interpretation, don't specify '*' unless you like answering parameter prompts.

```yaml
Type: String
Parameter Sets: NamePath, NameStore
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Template
The template object to build from.
Accepts objects returned by Get-PSMDTemplate.

```yaml
Type: TemplateInfo[]
Parameter Sets: Template
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Store
The template store to retrieve tempaltes from.
By default, all stores are queried.

```yaml
Type: String
Parameter Sets: NameStore
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Instead of a registered store, look in this path for templates.

```yaml
Type: String
Parameter Sets: NamePath
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
The path in which to create the output.
By default, it will create in the current directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Get-PSFConfigValue -FullName 'PSModuleDevelopment.Template.OutPath' -Fallback ".")
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the produced output.
Automatically inserted for any name parameter specified on creation.
Also used for creating a root folder, when creating a project.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Encoding
The encoding to apply to text files.
The default setting for this can be configured by updating the 'PSFramework.Text.Encoding.DefaultWrite' configuration setting.
The initial default value is utf8 with BOM.

```yaml
Type: EncodingParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'PSFramework.Text.Encoding.DefaultWrite')
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoFolder
Skip automatic folder creation for project templates.
By default, this command will create a folder to place files&folders in when creating a project.

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

### -Parameters
A Hashtable containing parameters for use in creating the template.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @{ }
Accept pipeline input: False
Accept wildcard characters: False
```

### -Raw
By default, all parameters will be replaced during invocation.
In Raw mode, this is skipped, reproducing mostly the original template input (dynamic scriptblocks will now be named scriptblocks)).

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

### -Force
If the target path the template should be written to (filename or folder name within $OutPath), then overwrite it.
By default, this function will fail if an overwrite is required.

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

### -Silent
This places the function in unattended mode, causing it to error on anything requiring direct user input.

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
