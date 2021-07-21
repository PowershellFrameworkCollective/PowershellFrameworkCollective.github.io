---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDBuildStep

## SYNOPSIS
Create or update a step from a build project.

## SYNTAX

```
Set-PSMDBuildStep [-Name] <String> [[-Weight] <Int32>] [[-Action] <String>] [[-Parameters] <Hashtable>]
 [[-Condition] <String>] [[-ConditionSet] <String>] [[-Dependency] <String[]>] [[-BuildProject] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Create or update a step from a build project.

## EXAMPLES

### EXAMPLE 1
```
Set-PSMDBuildStep -Name 'Create Session' -Action new-pssession -Parameters @{ VMName = 'labdc1'; CredentialPath = "%ProjectRoot%\creds\labdc1.cred";  }
```

Defines a new step named 'Create Session' using the 'new-pssession'-action.

## PARAMETERS

### -Name
The name of the step.
All step names must be unique within a single build project.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Weight
The weight of the step.
Weight determines processing order, the lower the number the earlier it is executed.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
The name of the action to execute.
Use Get-PSMDBuildAction to get a list of available actions.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameters
The parameters this action should take.
See the action object to see a description of parameters, including which must be provided and which can be skipped.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Condition
A PSFramework filter condition that must apply for this action to be executed successfully.
Example Conditions:
  Elevated
  PS7Plus -and OSWindows
More Details: https://psframework.org/documentation/documents/psframework/filters.html

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionSet
The name of the condition set to use.
This is part of the PSFramework filter system:
https://psframework.org/documentation/documents/psframework/filters.html

Specify as "\<module\> \<conditionsetname\>" format.
Default Value: PSFramework Environment

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dependency
Any other steps that must successfully finished in order for this step to execute.
ALL of the listed steps must have succeeded, skipped steps do not count.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BuildProject
The build project file to work against.
Specify the full path to the build project file.
This parameter can be skipped if a default project file has been defined.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
