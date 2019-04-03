---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDParameterHelp

## SYNOPSIS
Sets the content of a CBH parameter help.

## SYNTAX

```
Set-PSMDParameterHelp [-Path] <String> [-CommandName] <String> [-ParameterName] <String> [-HelpText] <String>
 [-DisableCache] [<CommonParameters>]
```

## DESCRIPTION
Sets the content of a CBH parameter help.
This command will enumerate all files in the specified folder and subfolders.
Then scan all files with extension .ps1 and .psm1.
In each of these files it will check out function definitions, see whether the name matches, then update the help for the specified parameter if present.

In order for this to work, a few rules must be respected:
- It will not work with help XML, only with CBH xml
- It will not work if the help block is above the function.
It must be placed within.
- It will not ADD a CBH, if none is present yet.
If there is no help for the specified parameter, it will simply do nothing, but report the fact.

## EXAMPLES

### EXAMPLE 1
```
Set-PSMDParameterHelp -Path "C:\PowerShell\Projects\MyModule" -CommandName "*" -ParameterName "Foo" -HelpText @"
```

This is some foo text
For a truly foo-some result
"@

Scans all files in the specified path.
- Considers every function found
- Will only process the parameter 'Foo'
- And replace the current text with the one specified

## PARAMETERS

### -Path
The base path where all the files are in.

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

### -CommandName
The name of the command to update.
Uses wildcard matching to match, so you can do a global update using "*"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParameterName
The name of the parameter to update.
Must be an exact match, but is not case sensitive.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HelpText
The text to insert.
- Do not include indents.
It will pick up the previous indents and reuse them
- Do not include an extra line, it will automatically add a separating line to the next element

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableCache
By default, this command caches the results of its execution in the PSFramework result cache.
This information can then be retrieved for the last command to do so by running Get-PSFResultCache.
Setting this switch disables the caching of data in the cache.

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
