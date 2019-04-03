---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFScriptblock

## SYNOPSIS
Stores a scriptblock in the central scriptblock store.

## SYNTAX

```
Set-PSFScriptblock [-Name] <String> [-Scriptblock] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION
Stores a scriptblock in the central scriptblock store.
This store can be accessed using Get-PSFScriptblock.
It is used to share scriptblocks outside of scope and runspace boundaries.
Scriptblocks thus registered can be accessed by C#-based services, such as the PsfValidateScript attribute.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFScriptblock -Name 'MyModule.TestServer' -Scriptblock $Scriptblock
```

Stores the scriptblock contained in $Scriptblock under the 'MyModule.TestServer' name.

## PARAMETERS

### -Name
The name of the scriptblock.
Must be unique, it is recommended to prefix the module name:
\<Module\>.\<Scriptblock\>

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

### -Scriptblock
The scriptcode to register

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Repeatedly registering the same scriptblock (e.g.
in multi-runspace scenarios) is completely safe:
- Access is threadsafe & Runspacesafe
- Overwriting the scriptblock does not affect the statistics

## RELATED LINKS
