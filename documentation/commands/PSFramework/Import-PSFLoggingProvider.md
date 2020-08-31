---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Import-PSFLoggingProvider

## SYNOPSIS
Imports logging provider code and configuration from a hosting source.

## SYNTAX

### Path (Default)
```
Import-PSFLoggingProvider [-Path <String>] [-EnableException] [<CommonParameters>]
```

### Data
```
Import-PSFLoggingProvider -Data <Object> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Imports logging provider code and configuration from a hosting source.
This enables centrally providing logging provider settings that are retrieved by running this command.

You can simply run this command with no arguments.
It will then only do anything, if there is a defined value for the configuration setting "PSFramework.Logging.Provider.Source".

If specifying a path or relying on the configuration setting above, it expects the path to ...
- Be either a weblink or a file system path
- Point at a json file containing the relevant provider information
- Be accessible without specific authentication information

Alternatively to specifying a path (or relying on the configured value), you can also give it the same data raw via the "-Data" parameter.
This needs to be the exact same data layout as provided by the json file, only already readied as PowerShell objects.

In both cases, you provide one or multiple items which may contain the following Properties (all others will be ignored):
- ProviderPath
- ProviderName
- InstallationConfig
- ProviderConfig

# Providerpath
#---------------

The ProviderPath property is a full or relative path to a scriptfile that contains LoggingProvider code.
A relative path would be relative to the path of the json file originally retrieved.
If calling this command with the "-Data" parameter, relative paths are not supported.
The scriptfile must be valid PowerShell code, however the original extension matters not.
The file will be run as untrusted code, so it will fail in Constraiend Language Mode, unless you sign the provider script with a whitelisted publisher certificate.

# ProviderName
#---------------

The name of the provider to install/configure.
This property is needed in order to use the subsequent two configuration properties.

Note: If specifying both ProviderPath and ProviderName, it will FIRST install the new provider.
You can thus deploy and configure a provider in the same setting.

# InstallationConfig
#---------------------

A PSObject with properties of its own.
These properties should contain the property & values you would use in Install-PSFLoggingProvider.
Invalid entries (property-names that do not match a parameter on Install-PSFLoggingProvider) in this call will cause an error loading the setting.

# ProviderConfig
#-----------------

A PSObject with properties of its own.
Or an array thereof, if you want to configure multiple instances of the same provider in one go.
Similar to the InstallationConfig property, these property/value pairs are used to dynamically bind to Set-PSFLoggingProvider, configuring the provider.


Example json file:
\[
	{
		"ProviderName":  "logfile",
		"ProviderConfig":  {
			"InstanceName":  "SystemLogInstance",
			"FilePath":  "C:\\\\logs\\\\MyTask-%date%.csv",
			"TimeFormat":  "yyyy-MM-dd HH:mm:ss.fff",
			"Enabled":  true
		}
	}
\]

## EXAMPLES

### EXAMPLE 1
```
Import-PSFLoggingProvider
```

Imports the preconfigured logging provider resource file (or silently does nothing if none is configured).

### EXAMPLE 2
```
Import-PSFLoggingProvider -Path \\server\share\psframework\logging.json
```

Imports the logging provider resource file from the specified network path.

## PARAMETERS

### -Path
Path to a json file providing logging provider settings or new logging providers to load.
Can be either a weblink or a file system path.
See description for details on how the json file should look like.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Data
The finished provider data to process.
The PowerShell object version of the json data otherwise provided through a path.
See description for details on how the data should look like.

```yaml
Type: Object
Parameter Sets: Data
Aliases:

Required: True
Position: Named
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
