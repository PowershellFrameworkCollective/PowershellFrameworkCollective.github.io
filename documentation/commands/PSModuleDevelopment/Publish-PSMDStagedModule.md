---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Publish-PSMDStagedModule

## SYNOPSIS
Publish a module to your staging repository.

## SYNTAX

### Name
```
Publish-PSMDStagedModule -Name <String> [-Repository <String>] [-EnableException] [<CommonParameters>]
```

### Path
```
Publish-PSMDStagedModule -Path <String> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Publish a module to your staging repository.
Always publishes the latest version available when specifying a name.

## EXAMPLES

### EXAMPLE 1
```
Publish-PSMDStagedModule -Name 'PSFramework'
```

Publishes the latest version of PSFramework found on the local machine.

### EXAMPLE 2
```
Publish-PSMDStagedModule -Name 'Microsoft.Graph' -Repository PSGallery
```

Publishes the entire kit of 'Microsoft.Graph' modules from the PSGallery to the staging repository.

## PARAMETERS

### -Name
The name of the module to publish.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path to the module to publish.

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
The repository from which to withdraw the module to then publish to the staging repository.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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
