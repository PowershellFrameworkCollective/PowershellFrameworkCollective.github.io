---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFTypeSerializationData

## SYNOPSIS
Registers serialization xml Typedata.

## SYNTAX

```
Register-PSFTypeSerializationData [-TypeData] <String[]> [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers serialization xml Typedata.
Use Get-PSFTypeSerializationData to generate such a string.
When building a module, consider shipping that xml type extension in a dedicated file as part of the module and import it as part of the manifest's 'TypesToProcess' node.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFTypeSerializationData -InputObject 'My.Custom.Type' | Register-PSFTypeSerializationData
```

Generates a custom type serialization xml and registers it.

## PARAMETERS

### -TypeData
The data to register.
Generate with Get-PSFTypeSerializationData.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
Where the file should be stored before appending.
While type extensions can be added at runtime directly from memory, from file is more reliable.
By default, a PSFramework path is chosen.
The default path can be configured under the 'PSFramework.Serialization.WorkingDirectory' confguration setting.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-PSFConfigValue -FullName 'PSFramework.Serialization.WorkingDirectory' -Fallback $script:path_typedata)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
