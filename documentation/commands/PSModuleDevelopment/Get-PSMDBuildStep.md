---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDBuildStep

## SYNOPSIS
Read the steps that are part of the specified build project.

## SYNTAX

```
Get-PSMDBuildStep [[-Name] <String>] [[-BuildProject] <String>] [<CommonParameters>]
```

## DESCRIPTION
Read the steps that are part of the specified build project.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDBuildStep
```

Read all steps that are part of the default build project.

### EXAMPLE 2
```
Get-PSMDBuildStep -Name CreateSession -BuildProject C:\code\Project\Project.build.json
```

Return the CreateSession step from the specified project file.

## PARAMETERS

### -Name
The name by which to filter the steps returned.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -BuildProject
Path to the build project file to read from.
Defaults to the currently selected project if available.
Use Select-PSMDBuildProject to select a default project.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
