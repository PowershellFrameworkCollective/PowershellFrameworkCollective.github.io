---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Resolve-PSMDBuildStepParameter

## SYNOPSIS
Resolves and consolidates the overall parameters of a given step.

## SYNTAX

```
Resolve-PSMDBuildStepParameter [-Parameters] <Hashtable> [-FromArtifacts] <Hashtable> [-ProjectName] <String>
 [-StepName] <String> [<CommonParameters>]
```

## DESCRIPTION
Resolves and consolidates the overall parameters of a given step.
This ensures that individual actions do not have to implement manual resolution and complex conditionals.
Sources of parameters:
- Explicitly defined parameter in the step
- Value from Artifacts
- Value from Configuration (only if not otherwise sourced)
- Value from implicit artifact resolution: Any value that is formatted like this:
  "%!NameOfArtifact!%" will be replaced with the value of the artifact of the same name.
  This supports wildcard resolution, so "%!Session.*!%" will resolve to all artifacts with a name starting with "Session."

Configuration-driven parameters follow this name scheme:
"PSModuleDevelopment.BuildParam.\<project\>.\<step\>.\<parameterName\>"

For example:
"PSModuleDevelopment.BuildParam.Admf.connect.credential"

## EXAMPLES

### EXAMPLE 1
```
Resolve-PSMDBuildStepParameter -Parameters $actualParameters -ProjectName VMDeployment -StepName 'Create Session'
```

Adds parameters provided through configuration.

## PARAMETERS

### -Parameters
The hashtable containing the currently specified parameters from the step configuration within the build project file.
Only settings not already defined there are taken from configuration.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FromArtifacts
The hashtable mapping parameters from artifacts.
This allows dynamically assigning artifacts to parameters.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProjectName
The name of the project being executed.
Supplementary parameters taken from configuration will pick up settings based on this name:
"PSModuleDevelopment.BuildParam.\<ProjectName\>.\<StepName\>.*"

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

### -StepName
The name of the step being executed.
Supplementary parameters taken from configuration will pick up settings based on this name:
"PSModuleDevelopment.BuildParam.\<ProjectName\>.\<StepName\>.*"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Collections.Hashtable
## NOTES

## RELATED LINKS
