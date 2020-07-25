---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDStagingRepository

## SYNOPSIS
Define the repository to use for deploying modules along with scripts.

## SYNTAX

### Path
```
Set-PSMDStagingRepository -Path <String> [<CommonParameters>]
```

### Repository
```
Set-PSMDStagingRepository -Repository <String> [<CommonParameters>]
```

## DESCRIPTION
Define the repository to use for deploying modules along with scripts.
By default, modules are deployed using the PSGallery, which may be problematic:
- Offline computers do not have access to it
- Low performance compared to a local mirror

## EXAMPLES

### EXAMPLE 1
```
Set-PSMDStagingRepository -Path 'C:\PowerShell\StagingRepo'
```

Registers the local path 'C:\PowerShell\StagingRepo' as a repository and will use it for deploying modules along with scripts.

## PARAMETERS

### -Path
The local path to use.
Will configure that path as a PSRepository.
The new repository will be named "PSMDStaging".

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Repository
The name of an existing repository to use

```yaml
Type: String
Parameter Sets: Repository
Aliases:

Required: True
Position: Named
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
