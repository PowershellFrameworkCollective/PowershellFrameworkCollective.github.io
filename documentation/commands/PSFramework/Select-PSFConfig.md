---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Select-PSFConfig

## SYNOPSIS
Select a subset of configuration entries and return them as objects.

## SYNTAX

```
Select-PSFConfig [[-FullName] <String>] [[-Depth] <Int32[]>] [<CommonParameters>]
```

## DESCRIPTION
Select a subset of configuration entries and return them as objects.

This can be used to retrieve related configuration entries as a single PowerShell object.

For example, assuming there are the following configuration entries:

LoggingProvider.LogFile.AutoInstall
LoggingProvider.LogFile.Enabled
LoggingProvider.LogFile.ExcludeModules
LoggingProvider.LogFile.ExcludeTags
LoggingProvider.LogFile.IncludeModules
LoggingProvider.LogFile.IncludeTags
LoggingProvider.LogFile.InstallOptional

Then this line:
Select-PSFConfig 'LoggingProvider.LogFile.*'

Will return a PSCustomObject that looks similar to this:

_Name           : LogFile
_FullName       : LoggingProvider.LogFile
_Depth          : 1
_Children       : {}
AutoInstall     : False
Enabled         : False
ExcludeModules  : {}
ExcludeTags     : {}
IncludeModules  : {}
IncludeTags     : {}
InstallOptional : True

This selection is recursive:
It will group on each part of the FullName of the selected configuration entries.
- Entries that only have children and no straight values (In the example above, that would be the first, the "LoggingProvider" node) will not be included and only return children.
- Entries with values AND children, will have child entries included in the _Children property.
- Even child entries of Entries with values will be returned

## EXAMPLES

### EXAMPLE 1
```
Select-PSFConfig 'LoggingProvider.LogFile.*'
```

Selects all configuration settings under 'LoggingProvider.LogFile.*', grouping the value ends as PSObject.

## PARAMETERS

### -FullName
String filter to select, which configuration entries to select on.
Use the same value on Get-PSFConfig to see what configuration entries will be processed.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Depth
Only entries at the specified depth level will be returned.
Depth starts at "0"
In the name 'LoggingProvider.LogFile.AutoInstall' ...

- "LoggingProvider" would be depth 0
- "LogFile" would be depth 1
- ...

```yaml
Type: Int32[]
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
