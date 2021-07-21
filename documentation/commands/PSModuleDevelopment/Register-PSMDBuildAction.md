---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Register-PSMDBuildAction

## SYNOPSIS
Register a new action usable in build projects.

## SYNTAX

```
Register-PSMDBuildAction [-Name] <String> [-Action] <ScriptBlock> [-Description] <String>
 [-Parameters] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
Register a new action usable in build projects.
Actions are the actual implementation logic that turns the configuration in a build project file into ...
well, actions.
Anyway, these are basically named scriptblocks with some metadata.
This command is used to provide all the builtin actions and can be used to freely define your own actions.

Whenever you use a "script" action in your build projects, consider ...
would it make a good configurable option valuable for other builds?
If so, that might just mark the birth of the next action!

## EXAMPLES

### EXAMPLE 1
```
Register-PSMDBuildAction -Name 'script' -Action $actionCode -Description 'Execute a custom scriptfile as part of your workflow' -Parameters $parameters
```

Creates / registers the action "script".

## PARAMETERS

### -Name
The name of the action.

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

### -Action
The actual code implementing the action.
Each action scriptblock will receive exactly one .

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

### -Description
A description explaining what the action is all about.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameters
The parameters the action accepts.
Provider a hashtable, with the keys being the parameter names and the values being a description of its parameter.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
