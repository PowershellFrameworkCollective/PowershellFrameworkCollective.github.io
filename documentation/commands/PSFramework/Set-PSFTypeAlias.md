---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFTypeAlias

## SYNOPSIS
Registers or updates an alias for a .NET type.

## SYNTAX

### Name (Default)
```
Set-PSFTypeAlias [-AliasName] <String> [-TypeName] <String> [<CommonParameters>]
```

### Hashtable
```
Set-PSFTypeAlias [-Mapping] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
Registers or updates an alias for a .NET type.
Use this function during module import to create shortcuts for typenames users can be expected to interact with directly.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFTypeAlias -AliasName 'file' -TypeName 'System.IO.File'
```

Creates an alias for the type 'System.IO.File' named 'file'

### EXAMPLE 2
```
Set-PSFTypeAlias -Mapping @{
```

file = 'System.IO.File'
	path = 'System.IO.Path'
}

Creates an alias for the type 'System.IO.File' named 'file'
Creates an alias for the type 'System.IO.Path' named 'path'

## PARAMETERS

### -AliasName
The short and useful alias for the type.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TypeName
The full name of the type.
Example: 'System.IO.FileInfo'

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Mapping
A hashtable of alias to typename mappings.
Useful to registering a full set of type aliases.

```yaml
Type: Hashtable
Parameter Sets: Hashtable
Aliases:

Required: True
Position: 1
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
