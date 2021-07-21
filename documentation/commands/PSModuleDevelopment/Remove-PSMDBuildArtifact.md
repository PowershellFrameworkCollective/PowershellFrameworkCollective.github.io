---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Remove-PSMDBuildArtifact

## SYNOPSIS
Removes an artifact from the build pipeline.

## SYNTAX

```
Remove-PSMDBuildArtifact [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes an artifact from the build pipeline.
Only interacts with the PSModuleDevelopment build system.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSMDBuildArtifact -Name 'session'
```

Removes the artifact 'session' from the build pipeline.

### EXAMPLE 2
```
Get-PSMDBuildArtifact -Tag pssession | Remove-PSMDBuildArtifact
```

Removes all artifacts with the 'pssession' tag from the build pipeline.

## PARAMETERS

### -Name
Name of the artifact to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
