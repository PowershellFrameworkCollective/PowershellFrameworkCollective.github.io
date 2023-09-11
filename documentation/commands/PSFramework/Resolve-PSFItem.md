---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Resolve-PSFItem

## SYNOPSIS
Resolves paths provided.

## SYNTAX

```
Resolve-PSFItem [[-Path] <String[]>] [[-LiteralPath] <String[]>] [[-Type] <String>]
 [[-ResolutionMode] <String>] [[-WarningMode] <String>] [[-ErrorMode] <String>] [[-ProviderName] <String>]
 [[-Cmdlet] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Resolves paths provided.
This command is designed as the ultimate tool for resolving paths provided with all flow control decisions handled.

The key difference between this command and Resolve-PSFPath is that this command directly integrates into the caller for the purposes of error handling.
It also handles a lot of the flow control issues merging and refining input and informing about issues.

Resolve-PSFPath simply takes a path and resolves that one path.

## EXAMPLES

### EXAMPLE 1
```
Resolve-PSFItem -Path $Path -LiteralPath $LiteralPath -Cmdlet $PSCmdlet
```

Searches all items found under the specified paths.

### EXAMPLE 2
```
Resolve-PSFItem -Path $Path -Type File -ResolutionMode AtLeastOne -WarningMode None -Cmdlet $PSCmdlet
```

Searches for all files under $Path.
No warning will ever be generated, but at least one file must be found, otherwise the calling command is killed with a terminating exception.

## PARAMETERS

### -Path
The paths to resolve.
Interprets wildcards.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LiteralPath
The paths to resolve.
Does not interpret wildcards.

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

### -Type
What kind of item to return:
- Any: Return anything of the correct provider.
- File/Leaf: Only return file (or leaf) objects.
- Directory/Container: Only return directory (or container) objects.
Default: Any

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Any
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResolutionMode
The resolution mode determines in which situation the command figures there is an actual error.
ErrorMode then determines how bad of an error to generate.
- Any: Any number of results (including none) is ok.
In this scenario we do not generate an error.
- All: For each path provided, at least one item must be found.
Any input path without result causes an error.
- AtLeastOne: At least one path must have been found in total
- OnlyOne: More than one result in total causes an error.
Default: Any

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Any
Accept pipeline input: False
Accept wildcard characters: False
```

### -WarningMode
Warnings are potentially generated for each path that has no result.
Warning processing is independent of error handling.
- None: No warning is generated, no matter what
- One: One summary warning is generated, listing all input paths without a result
- All: One warning is generated for each path without results
Default: One

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: One
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorMode
If the ResolutionMode has determined, that an error state exists, it is up to this ErrorMode parameter to determine just what kind of error state happens.
- Terminating: A terminating error is generated
- NonTerminating: A non-terminating error is generated
Default: Terminating

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: Terminating
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProviderName
Name of the provider generating the items.
Defaults to: FileSystem

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: FileSystem
Accept pipeline input: False
Accept wildcard characters: False
```

### -Cmdlet
The $PSCmdlet object representing the calling command
If this parameter is specified, the error is executed in the context of the calling command, not Resolve-PSFItem.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
