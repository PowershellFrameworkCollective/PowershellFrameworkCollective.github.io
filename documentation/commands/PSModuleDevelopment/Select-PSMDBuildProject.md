---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Select-PSMDBuildProject

## SYNOPSIS
Set the specified build project as the default project.

## SYNTAX

```
Select-PSMDBuildProject [-Path] <String> [-Register] [<CommonParameters>]
```

## DESCRIPTION
Set the specified build project as the default project.
This will have most other commands in this Component automatically use the specified project.

## EXAMPLES

### EXAMPLE 1
```
Select-PSMDBuildProject -Path 'c:\code\Project\Project.build.json'
```

Sets the specified build project as the default project.

## PARAMETERS

### -Path
Path to the project file to pick.

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

### -Register
Persist the choice as default build project file across PowerShell sessions.

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
