---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFPowerShell

## SYNOPSIS
Tests for conditions in the PowerShell environment.

## SYNTAX

```
Test-PSFPowerShell [[-PSMinVersion] <Version>] [[-PSMaxVersion] <Version>] [[-Edition] <PSEdition>]
 [[-OperatingSystem] <OperatingSystem>] [-Elevated] [[-ComputerName] <ComputerParameter>]
 [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
This helper command can evaluate various runtime conditions, such as:
- PowerShell Version
- PowerShell Edition
- Operating System
- Elevation
This makes it easier to do conditional code.
It also makes it easier to simulate code-paths during pester tests, by mocking this command.

## EXAMPLES

### EXAMPLE 1
```
Test-PSFPowerShell -PSMinVersion 5.0
```

Will return $false, unless the executing powershell version is at least 5.0

### EXAMPLE 2
```
Test-PSFPowerShell -Edition Core
```

Will return $true, if the current powershell session is a PowerShell core session.

### EXAMPLE 3
```
Test-PSFPowerShell -Elevated
```

Will return $false if on windows and not running as admin.
Will return $true otherwise.

### EXAMPLE 4
```
Test-PSFPowerShell -PSMinVersion 6.1 -OperatingSystem Windows
```

Will return $false unless executed on a PowerShell 6.1 console running on windows.

## PARAMETERS

### -PSMinVersion
PowerShell must be running under at least this version.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSMaxVersion
PowerShell most not be runnign on a version higher than this.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Edition
PowerShell must be running in the specifioed edition (Core or Desktop)

```yaml
Type: PSEdition
Parameter Sets: (All)
Aliases:
Accepted values: Desktop, Core

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OperatingSystem
PowerShell must be running on the specified OS.

```yaml
Type: OperatingSystem
Parameter Sets: (All)
Aliases: OS
Accepted values: Windows, Linux, MacOS

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Elevated
PowerShell must be running with elevation.

Note:
This test is only supported on Windows.
On other OS it will automatically succede and assume root privileges.

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

### -ComputerName
The computer on which to test local PowerShell conditions.
If this parameter is not specified, it tests the current PowerShell process and hosting OS.
Accepts established PowerShell sessions.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The credentials to use when connecting to a remote computer.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES

## RELATED LINKS
