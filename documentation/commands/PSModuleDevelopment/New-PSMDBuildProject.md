---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDBuildProject

## SYNOPSIS
Create a new build project file.

## SYNTAX

### default (Default)
```
New-PSMDBuildProject -Name <String> -Path <String> [-Condition <String>] [-ConditionSet <String>]
 [<CommonParameters>]
```

### NoSelect
```
New-PSMDBuildProject -Name <String> -Path <String> [-Condition <String>] [-ConditionSet <String>] [-NoSelect]
 [<CommonParameters>]
```

### Register
```
New-PSMDBuildProject -Name <String> -Path <String> [-Condition <String>] [-ConditionSet <String>] [-Register]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new build project file.
Build projects are used to configure a repeatable, managed set of steps that make up a workflow.
It is designed with software build processes in mind, but can be used for pretty much anything that works in separate steps.

See the help on Invoke-PSMDBuildProject for more details.

NOTE: This is not the tool or component to create new PowerShell _code_ projects / repositories!
To create a new PowerShell module project, instead run:

	Invoke-PSMDTemplate PSFProject

## EXAMPLES

### EXAMPLE 1
```
New-PSMDBuildProject -Name 'VMDeployment' -Path 'C:\Code\VMDeployment'
```

Create a new build project named 'VMDeployment' in the folder 'C:\Code\VMDeployment'

## PARAMETERS

### -Name
The name of the build project.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path to the folder in which the build project file is created.
Final path will be: "\<Path\>\\\<Name\>.build.json"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Condition
A condition - a filter expression - that must be met in order for the build to proceed.
For more details on filter conditions, see the PSFramework documentation on its feature:
https://psframework.org/documentation/documents/psframework/filters.html

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
Position: Named
Default value: PSFramework Environment
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoSelect
Do not select the newly created build project as the default project for the current session.
By default, the newly created build project will be set as default project, in order to facilitate adding steps to it.
Use Select-PSMDBuildProject to explicitly set a default project file.

```yaml
Type: SwitchParameter
Parameter Sets: NoSelect
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Persist the newly created build project as default build project beyond the current session.
By default, the newly created build project will already be set as default project, in order to facilitate adding steps to it.
But ONLY for the current session.
This parameter makes it remember in new PowerShell sessions as well.

```yaml
Type: SwitchParameter
Parameter Sets: Register
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
