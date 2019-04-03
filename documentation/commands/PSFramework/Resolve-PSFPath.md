---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Resolve-PSFPath

## SYNOPSIS
Resolves a path.

## SYNTAX

```
Resolve-PSFPath [-Path] <String[]> [-Provider <String>] [-SingleItem] [-NewChild] [<CommonParameters>]
```

## DESCRIPTION
Resolves a path.
Will try to resolve to paths including some basic path validation and resolution.
Will fail if the path cannot be resolved (so an existing path must be reached at).

## EXAMPLES

### EXAMPLE 1
```
Resolve-PSFPath -Path report.log -Provider FileSystem -NewChild -SingleItem
```

Ensures the resolved path is a FileSystem path.
This will resolve to the current folder and the file report.log.
Will not ensure the file exists or doesn't exist.
If the current path is in a different provider, it will throw an exception.

### EXAMPLE 2
```
Resolve-PSFPath -Path ..\*
```

This will resolve all items in the parent folder, whatever the current path or drive might be.

## PARAMETERS

### -Path
The path to validate.

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

### -Provider
Ensure the path is of the expected provider.
Allows ensuring one does not operate in the wrong provider.
Common providers include the filesystem, the registry or the active directory.

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

### -SingleItem
Ensure the path should resolve to a single path only.
This may - intentionally or not - trip up wildcard paths.

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

### -NewChild
Assumes one wishes to create a new child item.
The parent path will be resolved and must validate true.
The final leaf will be treated as a leaf item that does not exist yet.

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
