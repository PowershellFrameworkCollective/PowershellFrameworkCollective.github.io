---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDModuleNugetPackage

## SYNOPSIS
Creates a nuget package from a PowerShell module.

## SYNTAX

```
New-PSMDModuleNugetPackage [-ModulePath] <String[]> [[-PackagePath] <String>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
This function will take a module and wrap it into a nuget package.
This is accomplished by creating a temporary local filesystem repository and using the PowerShellGet module to do the actual writing.

Note:
- Requires PowerShellGet module
- Dependencies must be built first to the same folder

## EXAMPLES

### EXAMPLE 1
```
New-PSMDModuleNugetPackage -PackagePath 'c:\temp\package' -ModulePath .\DBOps
```

Packages the module stored in .\DBOps and stores the nuget file in 'c:\temp\package'

## PARAMETERS

### -ModulePath
Path to the PowerShell module you are creating a Nuget package from

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: ModuleBase

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -PackagePath
Path where the package file will be copied.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-PSFConfigValue -FullName 'PSModuleDevelopment.Package.Path' -Fallback "$env:TEMP")
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
Author: Mark Wilkinson
Editor: Friedrich Weinmann

## RELATED LINKS
