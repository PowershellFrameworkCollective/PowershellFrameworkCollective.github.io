---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFScriptblock

## SYNOPSIS
Access the scriptblocks stored with Set-PSFScriptblock.

## SYNTAX

### Name (Default)
```
Get-PSFScriptblock -Name <String[]> [<CommonParameters>]
```

### List
```
Get-PSFScriptblock [-Name <String[]>] [-List] [<CommonParameters>]
```

## DESCRIPTION
Access the scriptblocks stored with Set-PSFScriptblock.

Use this command to access scriptblocks designed for easy, processwide access.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFScriptblock -Name 'MyModule.TestServer'
```

Returns the scriptblock stored as 'MyModule.TestServer'

### EXAMPLE 2
```
Get-PSFScriptblock -List
```

Returns a list of all scriptblocks

### EXAMPLE 3
```
Get-PSFScriptblock -List -Name 'MyModule.TestServer'
```

Returns scriptblock and meta information for the MyModule.TestServer scriptblock.

## PARAMETERS

### -Name
The name of the scriptblock to request.
It's mandatory for explicitly requesting a scriptblock, but optional to use with -List as a filter.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: *
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
Type: String[]
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -List
Instead of requesting a specific scriptblock, list the available ones.
This can be further filtered by using a wildcard supporting string as -Name.

```yaml
Type: SwitchParameter
Parameter Sets: List
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.Utility.ScriptBlockItem
### System.Management.Automation.ScriptBlock
## NOTES

## RELATED LINKS
