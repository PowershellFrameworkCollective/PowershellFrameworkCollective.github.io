---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Find-PSMDFileContent

## SYNOPSIS
Used to quickly search in module files.

## SYNTAX

```
Find-PSMDFileContent [-Pattern] <String> [-Extension <String>] [-Path <String>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
This function can be used to quickly search files in your module's path.
By using Set-PSMDModulePath (or Set-PSFConfig 'PSModuleDevelopment.Module.Path' '\<path\>') you can set the default path to search in.
Using
  Register-PSFConfig -FullName 'PSModuleDevelopment.Module.Path'
allows you to persist this setting across sessions.

## EXAMPLES

### EXAMPLE 1
```
Find-PSMDFileContent -Pattern 'Get-Test'
```

Searches all module files for the string 'Get-Test'.

## PARAMETERS

### -Pattern
The text to search for, can be any regex pattern

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

### -Extension
The extension of files to consider.
Only files with this extension will be searched.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'PSModuleDevelopment.Find.DefaultExtensions')
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path to use as search base.
Defaults to the path found in the setting 'PSModuleDevelopment.Module.Path'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'PSModuleDevelopment.Module.Path')
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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
