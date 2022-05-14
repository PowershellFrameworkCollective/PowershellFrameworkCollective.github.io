---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFTempProvider

## SYNOPSIS
Register a plugin extending the ability to define and manage temporary items.

## SYNTAX

```
Register-PSFTempProvider [-Name] <String> [-ExistsScript] <ScriptBlock> [-DeleteScript] <ScriptBlock>
 [[-CreationScript] <ScriptBlock>] [<CommonParameters>]
```

## DESCRIPTION
Register a plugin extending the ability to define and manage temporary items.
The Temporary Item Provider implements the logic that makes a temporary item category possible.
Want to be able to define temporary user acounts?
Well, this is where you tell the system how that is supposed to work!

Example implementation:

Register-PSFTempProvider -Name TempFile -CreationScript {
	param ($Data)
	$newPath = Join-Path (Get-PSFPath temp) (Get-Random)
	New-Item -Path $newPath -ItemType File
} -ExistsScript {
	param ($Data, $CreationData)
	Test-Path $CreationData.FullName
} -DeleteScript {
	param ($Data, $CreationData)
	Remove-Item $CreationData.FullName
}

## EXAMPLES

### EXAMPLE 1
```
Register-PSFTempProvider -Name 'aduser' -ExistsScript $existsScript -DeleteScript $deleteScript -CreationScript $creationScript
```

Registers a provider to create temporary ad users

## PARAMETERS

### -Name
Name of the Provider, which is referenced by temp items during their creation.

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

### -ExistsScript
A scriptblock that validates, whether a given item still exists.
Receives two arguments: $Data and $CreationData
The former is what was specified when running New-PSFTempItem, the latter what was returned as its result.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeleteScript
Scriptblock that will delete the temp item it is applied to.
Receives two arguments: $Data and $CreationData
The former is what was specified when running New-PSFTempItem, the latter what was returned as its result.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreationScript
A scriptblock that is run during New-PSFTempItem.
It receives a single argument - $Data, as provided to the command - and is expected to perform any creation tasks that might be needed.
It should either return nothing, or return a single object, not a list of values.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
