---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDTemplate

## SYNOPSIS
Creates a template from a reference file / folder.

## SYNTAX

### Project (Default)
```
New-PSMDTemplate [-ReferencePath] <String> [[-TemplateName] <String>] [-Filter <String>] [-OutStore <String>]
 [-OutPath <String>] [-Exclusions <String[]>] [-Version <Version>] [-Description <String>] [-Author <String>]
 [-Tags <String[]>] [-Force] [-EnableException] [<CommonParameters>]
```

### File
```
New-PSMDTemplate [-FilePath] <String> [-TemplateName] <String> [-Filter <String>] [-OutStore <String>]
 [-OutPath <String>] [-Exclusions <String[]>] [-Version <Version>] [-Description <String>] [-Author <String>]
 [-Tags <String[]>] [-Force] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
This function creates a template based on an existing folder or file.
It automatically detects parameters that should be filled in one creation time.

# Template reference: #
#---------------------#
Project templates can be preconfigured by a special reference file in the folder root.
This file must be named "PSMDTemplate.ps1" and will not be part of the template.
It must emit a single hashtable with various pieces of information.

This hashtable can have any number of the following values, in any desired combination:
- Scripts: A Hashtable, of scriptblocks.
These are scripts used for replacement parameters, the key is the name used on insertions.
- TemplateName: Name of the template
- Version: The version number for the template (See AutoIncrementVersion property)
- AutoIncrementVersion: Whether the version number should be incremented
- Tags: Tags to add to a template - makes searching and finding templates easier
- Author: Name of the author of the template
- Description: Description of the template
- Exclusions: List of relative file/folder names to not process / skip.
Each of those entries can also be overridden by specifying the corresponding parameter of this function.

# Parameterizing templates: #
#---------------------------#
The script will pick up any parameter found in the files and folders (including the file/folder name itself).
There are three ways to do this:
- Named text replacement: The user will need to specify what to insert into this when creating a new project from this template.
- Scriptblock replacement: The included scriptblock will be executed on initialization, in order to provide a text to insert.
Duplicate scriptblocks will be merged.
- Named scriptblock replacement: The template reference file can define scriptblocks, their value will be inserted here.
The same name can be reused any number of times across the entire project, it will always receive the same input.

Naming Rules:
- Parameter names cannot include the characters '!', '{', or '}'
- Parameter names cannot include the parameter identifier.
This is by default 'þ'.
This identifier can be changed by updating the 'psmoduledevelopment.template.identifier' configuration setting.
- Names are not case sensitive.

Examples:
° Named for replacement:
"Test þnameþ" --\> "Test \<inserted text of parameter\>"

° Scriptblock replacement:
"Test þ{ $env:COMPUTERNAME }þ" --\> "Test \<Name of invoking computer\>"
- Important: No space between identifier and curly braces!
- Scriptblock can have multiple lines.

° Named Scriptblock replacement:
"Test þ!ClosestDomainController!þ" --\> "Test \<Result of script ClosestDomainController\>"
- Named Scriptblocks are created by using a template reference file (see section above)

## EXAMPLES

### EXAMPLE 1
```
New-PSMDTemplate -FilePath .\þnameþ.Test.ps1 -TemplateName functiontest
```

Creates a new template named 'functiontest', based on the content of '.\þnameþ.Test.ps1'

## PARAMETERS

### -ReferencePath
Root path in which all files are selected for creating a template project.
The folder will not be part of the template, only its content.

```yaml
Type: String
Parameter Sets: Project
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilePath
Path to a single file.
Used to create a template for that single file, instead of a full-blown project.
Note: Does not support template reference files.

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateName
Name of the template.

```yaml
Type: String
Parameter Sets: Project
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
Only files matching this filter will be included in the template.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutStore
Where the template will be stored at.
By default, it will push the template to the default store (A folder in appdata unless configuration was changed).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
If the template should be written to a specific path instead.
Specify a folder.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exclusions
The relative path of the files or folders to ignore.
Ignoring folders will also ignore all items in the folder.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
The version of the template.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1.0.0.0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
A description text for the template itself.
This will be visible to the user before invoking the template and should describe what this template is for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Author
The author of the template.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'PSModuleDevelopment.Template.ParameterDefault.Author' -Fallback $env:USERNAME)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Tags to apply to the template, making it easier to filter & search.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
If the template in the specified version in the specified destination already exists, this will fail unless the Force parameter is used.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
