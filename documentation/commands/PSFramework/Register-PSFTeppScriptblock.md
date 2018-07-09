---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFTeppScriptblock

## SYNOPSIS
Registers a scriptblock under name, to later be available for TabExpansion.

## SYNTAX

```
Register-PSFTeppScriptblock [-ScriptBlock] <ScriptBlock> [-Name] <String> [[-Mode] <TeppScriptMode>]
 [[-CacheDuration] <TimeSpanParameter>] [<CommonParameters>]
```

## DESCRIPTION
Registers a scriptblock under name, to later be available for TabExpansion.

This system supports two separate types of input: Full or Simple.

Simple:
The scriptblock simply must return string values.
PSFramework will then do the rest of the processing when the user asks for tab completion.
This is the simple-most way to implement tab completion, for a full example, look at the first example in this help.

Full:
A full scriptblock implements all that is needed to provide Tab Expansion.
For more details and guidance, see the following concept help:
Get-Help about_psf_tabexpansion

## EXAMPLES

### EXAMPLE 1
```
Register-PSFTeppScriptblock -Name "psalcohol-liquids" -ScriptBlock { "beer", "mead", "wine", "vodka", "whiskey", "rum" }
```

Register-PSFTeppArgumentCompleter -Command Get-Alcohol -Parameter Type -Name "psalcohol-liquids"

In step one we set a list of questionable liquids as the list of available beverages for parameter 'Type' on the command 'Get-Alcohol'

### EXAMPLE 2
```
Register-PSFTeppScriptblock -ScriptBlock $scriptBlock -Name MyFirstTeppScriptBlock
```

Stores the scriptblock stored in $scriptBlock under the name "MyFirstTeppScriptBlock"

### EXAMPLE 3
```
$scriptBlock = { (Get-ChildItem (Get-PSFConfigValue -FullName mymodule.path.scripts -Fallback "$env:USERPROFILE\Documents\WindowsPowerShell\Scripts")).FullName }
```

Register-PSFTeppScriptblock -Name mymodule-scripts -ScriptBlock $scriptBlock -Mode Simple

Stores a simple scriptblock that will return a list of strings under the name "mymodule-scripts".
The system will wrap all the stuff around this that is necessary to provide Tab Expansion and filter out output that doesn't fit the user input so far.

## PARAMETERS

### -ScriptBlock
The scriptblock to register.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name under which the scriptblock should be registered.
It is recommended to prefix the name with the module (e.g.: mymodule.\<name\>), as names are shared across all implementing modules.

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

### -Mode
Whether the script provided is a full or simple scriptblock.
By default, this function automatically detects this, but just in case, you can override this detection.

```yaml
Type: TeppScriptMode
Parameter Sets: (All)
Aliases:
Accepted values: Simple, Full, Auto

Required: False
Position: 3
Default value: Auto
Accept pipeline input: False
Accept wildcard characters: False
```

### -CacheDuration
How long a tab completion result is valid.
By default, PSFramework tab completion will run the scriptblock on each call.
This can be used together with a background refresh mechanism to offload the cost of expensive queries into the background.
See Set-PSFTeppResult for details on how to refresh the cache.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
