---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDBuildProject

## SYNOPSIS
Reads & returns a build project.

## SYNTAX

### Path (Default)
```
Get-PSMDBuildProject -Path <String> [-Name <String>] [<CommonParameters>]
```

### Selected
```
Get-PSMDBuildProject [-Selected] [<CommonParameters>]
```

## DESCRIPTION
Reads & returns a build project.
A build project is a container including the steps executed during the build.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDBuildProject -Path 'C:\code\project' -Name project
```

Will load the build project stored in the file "C:\code\project\project.build.json"

## PARAMETERS

### -Path
Path to the build project file.
May target the folder, in which case the -Name parameter must be specified.

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

### -Name
The name of the build project to read.
Use together with the -Path parameter only.
Absolute file path assumed will be: "\<Path\>\\\<Name\>.build.json"

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Selected
Rather than specifying the path to read from, return the currently selected build project.
Use Select-PSMDBuildProject to select a build project as the default ("selected") project.

```yaml
Type: SwitchParameter
Parameter Sets: Selected
Aliases:

Required: True
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
