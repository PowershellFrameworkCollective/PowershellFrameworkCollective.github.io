---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Resolve-PSMDBuildStepParameter

## SYNOPSIS
Update missing build action parameters from the configuration system.

## SYNTAX

```
Resolve-PSMDBuildStepParameter [-Parameters] <Hashtable> [-FromArtifacts] <Hashtable> [-ProjectName] <String>
 [-StepName] <String> [<CommonParameters>]
```

## DESCRIPTION
Update missing build action parameters from the configuration system.
This command is for use within the defined code of build actions.

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
