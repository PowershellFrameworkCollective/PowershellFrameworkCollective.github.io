---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDBuildArtifact

## SYNOPSIS
Retrieve an artifact during a build project's execution.

## SYNTAX

```
Get-PSMDBuildArtifact [[-Name] <String>] [[-Tag] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve an artifact during a build project's execution.
These artifacts are usually created during such an execution and discarded once completed.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDBuildArtifact
```

List all available artifacts.

### EXAMPLE 2
```
Get-PSMDBuildArtifact -Name ReleasePath
```

Returns the artifact named "ReleasePath"

### EXAMPLE 3
```
Get-PSMDBuildArtifact -Tag pssession
```

Returns all artifacts with the tag "pssession"

## PARAMETERS

### -Name
The name by which to search for artifacts.
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

### -Tag
Search for artifacts by tag.
Artifacts can receive tag for better categorization.
When specifying multiple tags, any artifact containing at least one of them will be returned.

```yaml
Type: String[]
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
