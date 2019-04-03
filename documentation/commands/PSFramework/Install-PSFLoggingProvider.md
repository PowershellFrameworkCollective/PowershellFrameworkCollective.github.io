---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Install-PSFLoggingProvider

## SYNOPSIS
Installs a logging provider for the PSFramework.

## SYNTAX

```
Install-PSFLoggingProvider [[-Name] <String>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
This command installs a logging provider registered with the PSFramework.

Some providers may require special installation steps, that cannot be handled by the common initialization / configuration.
For example, a provider may require installation of binaries that require elevation.

In order to cover those scenarios, a provider can include an installation script, which is called by this function.
It can also provide additional parameters to this command, which are dynamically provided once the -Name parameter has been passed.

When registering the logging provider (Using Register-PSFLoggingProvider), you can specify the logic executed by this command with these parameters:
- IsInstalledScript :      Must return $true when installation has already been performed.
If this returns not $false, then this command will do nothing at all.
- InstallationScript :     The script performing the actual installation
- InstallationParameters : A script that returns dynamic parameters.
This can be used to generate additional parameters that can modify the installation process.

NOTE:
This module does not contain help/guidance on how to generate dynamic parameters!

## EXAMPLES

### EXAMPLE 1
```
Install-PSFLoggingProvider -Name Eventlog
```

Installs a logging provider named 'eventlog'

## PARAMETERS

### -Name
The name of the provider to install

```yaml
Type: String
Parameter Sets: (All)
Aliases: Provider, ProviderName

Required: False
Position: 1
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
