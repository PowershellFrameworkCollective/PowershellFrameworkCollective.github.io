---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Publish-PSMDBuildArtifact

## SYNOPSIS
Create a new artifact for the current build pipeline.

## SYNTAX

```
Publish-PSMDBuildArtifact [-Name] <String> [-Value] <Object> [[-Tag] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Create a new artifact for the current build pipeline.
Use this create artifacts that are accessible in later steps in the pipeline.

Usually, artifacts are deleted at the end of a build process.
They are always cleared at the beginning of a new one.

Artifacts are NOT persisted across PowerShell sessions.

## EXAMPLES

### EXAMPLE 1
```
Publish-PSMDBuildArtifact -Name 'session' -Value $session -Tag 'pssession'
```

Publishes an artifact named "session" containing the content of $session that is tagged as a PowerShell remoting session.

## PARAMETERS

### -Name
Name of the Artifact to create.
Technically there are no limits to which character to chose, but we strongly encourage restricting yourself to letters, numbers, dash, underscore and dot.

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

### -Value
The value to assign to the artifact.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tag
Any tags to add to an artifact.
Tags can be searched for in order to bulk-operate against all artifacts of that tag.
For example, the "remove-pssession" action can remove all remoting sessions for all artifacts tagged as "pssession".

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
