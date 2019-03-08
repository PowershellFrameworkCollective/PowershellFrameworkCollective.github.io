---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFSupportPackage

## SYNOPSIS
Creates a package of troubleshooting information that can be used by developers to help debug issues.

## SYNTAX

```
New-PSFSupportPackage [[-Path] <String>] [[-Include] <SupportData>] [[-Exclude] <SupportData>]
 [[-Variables] <String[]>] [-ExcludeError] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
This function creates an extensive debugging package that can help with reproducing and fixing issues.

The file will be created on the desktop by default and will contain quite a bit of information:
- OS Information
- Hardware Information (CPU, Ram, things like that)
- .NET Information
- PowerShell Information
- Your input history
- The In-Memory message log
- The In-Memory error log
- Screenshot of the console buffer (Basically, everything written in your current console, even if you have to scroll upwards to see it).

## EXAMPLES

### EXAMPLE 1
```
New-PSFSupportPackage
```

Creates a large support pack in order to help us troubleshoot stuff.

## PARAMETERS

### -Path
The folder where to place the output xml in.
Defaults to your desktop.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$($env:USERPROFILE)\Desktop"
Accept pipeline input: False
Accept wildcard characters: False
```

### -Include
What to include in the export.
By default, all is included.

```yaml
Type: SupportData
Parameter Sets: (All)
Aliases:
Accepted values: None, Message, ErrorMessage, Messages, Screenshot, OperatingSystem, CPU, Ram, Environment, PSVersion, History, Module, SnapIns, Assemblies, PSResource, Exceptions, Critical, ExtensionData, All

Required: False
Position: 2
Default value: All
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exclude
Anything not to include in the export.
Use this to explicitly exclude content you do not wish to be part of the dump (for example for data protection reasons).

```yaml
Type: SupportData
Parameter Sets: (All)
Aliases:
Accepted values: None, Message, ErrorMessage, Messages, Screenshot, OperatingSystem, CPU, Ram, Environment, PSVersion, History, Module, SnapIns, Assemblies, PSResource, Exceptions, Critical, ExtensionData, All

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Variables
Name of additional variables to attach.
This allows you to add the content of variables to the support package, if you believe them to be relevant to the case.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeError
By default, the content of $Error is included, as it often can be helpful in debugging, even with error handling using the message system.
However, there can be rare instances where this will explode the total export size to gigabytes, in which case it becomes necessary to skip this.

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

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Silent

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
