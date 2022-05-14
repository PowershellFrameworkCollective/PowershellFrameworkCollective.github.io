---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Import-PSFPowerShellDataFile

## SYNOPSIS
A wrapper command around Import-PowerShellDataFile

## SYNTAX

### ByPath
```
Import-PSFPowerShellDataFile [-Path <String[]>] [-Unsafe] [<CommonParameters>]
```

### ByLiteralPath
```
Import-PSFPowerShellDataFile [-LiteralPath <String[]>] [-Unsafe] [<CommonParameters>]
```

## DESCRIPTION
A wrapper command around Import-PowerShellDataFile
This enables use of the command on PowerShell 3+ as well as during JEA endpoints.

Note: The protective value of Import-PowerShellDataFile is only offered when run on PS5+.
This is merely meant to provide compatibility in the scenarios, where the original command would fail!
If you care about PowerShell security, update to the latest version (in which case this command is still as secure as the default command, as that is what will actually be run).

Also supports importing Json files.

## EXAMPLES

### EXAMPLE 1
```
Import-PSFPowerShellDataFile -Path .\data.psd1
```

Safely loads the data stored in data.psd1

### EXAMPLE 2
```
Import-PSFPowerShellDataFile -Path .\data.json
```

Safely loads the data stored in data.json

## PARAMETERS

### -Path
The path from which to load the data file.

```yaml
Type: String[]
Parameter Sets: ByPath
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LiteralPath
The path from which to load the data file.
In opposite to the Path parameter, input here will not be interpreted.

```yaml
Type: String[]
Parameter Sets: ByLiteralPath
Aliases: PSPath

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Unsafe
Disables the protective value of Import-PowerShellDataFile.
This effectively runs the provided powershell scriptfile as untrusted scriptfile, no matter the environment.
By default, Import-PowerShellDataFile would only process the first hashtable, while unsafe mode allows files with multiple hashtables or more dynamic content.

Note: In environments with tight security constraints, the file imported will be executed in constrained lnguage mode, even if the source file is trusted.
Specifically, path-based rules will be ignored and .cab files will have no effect, but directly signed and trusted files will remain unconstrained.

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
