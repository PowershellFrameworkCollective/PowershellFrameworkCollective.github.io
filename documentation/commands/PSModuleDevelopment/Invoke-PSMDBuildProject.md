---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Invoke-PSMDBuildProject

## SYNOPSIS
Execute a build project.

## SYNTAX

```
Invoke-PSMDBuildProject [[-Path] <String>] [-InheritArtifacts] [-RetainArtifacts] [<CommonParameters>]
```

## DESCRIPTION
Execute a build project.
A build project is a configured chain of actions that have been configured in json.
They will be processed in their specified order and allow manageable, configurable steps without having to reinvent the same action again and again.

+ Individual action types become available using Register-PSMDBuildAction.
+ Create new build projects using New-PSMDBuildProject
+ Set up steps taken during a build using Set-PSMDBuildStep
+ Select the default build project using Select-PSMDBuildProject

## EXAMPLES

### EXAMPLE 1
```
Invoke-PSMDBuildProject -Path .\VMDeployment.build.Json
```

Execute the build file "VMDeployment.build.json" from the current folder

### EXAMPLE 2
```
build
```

Execute the default build project.

## PARAMETERS

### -Path
The path to the build project file to execute.
Mandatory if no build project has been selected as the default project.
Use the Select-PSMDBuildProject to define a default project (and optionally persist the choice across sessions)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InheritArtifacts
Accept artifacts that were generated before ever executing this pipeline.
By default, any artifacts previously provisioned are cleared on pipeline start.

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

### -RetainArtifacts
Whether, after executing the project, its artifacts should be retained.
By default, any artifacts created during a build project will be discarded upon project completion.

Artifacts are similar to variables to the pipeline and can be used to pass data throughout the pipeline.

+ Use Publish-PSMDBuildArtifact to create a new artifact.
+ Use Get-PSMDBuildArtifact to access existing build artifacts.

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
