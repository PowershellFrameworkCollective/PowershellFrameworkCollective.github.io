---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFMessageEvent

## SYNOPSIS
Registers an event to when a message is written.

## SYNTAX

```
Register-PSFMessageEvent -Name <String> -ScriptBlock <ScriptBlock> [-MessageFilter <String>]
 [-ModuleNameFilter <String>] [-FunctionNameFilter <String>] [-TargetFilter <Object>]
 [-LevelFilter <MessageLevel[]>] [-TagFilter <String[]>] [-RunspaceFilter <Guid>] [<CommonParameters>]
```

## DESCRIPTION
Registers an event to when a message is written.
These events will fire whenever the written message fulfills the specified filter criteria.

This allows integrating direct alerts and reactions to messages as they occur.

Warnings:
- Adding many subscriptions can impact overall performance, even without triggering.
- Events are executed synchronously.
executing complex operations may introduce a significant delay to the command execution.

It is recommended to push processing that involves outside resources to a separate runspace, then use the event to pass the object as trigger.
The TaskEngine component may prove to be just what is needed to accomplish this.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFMessageEvent -Name 'Mymodule.OffloadTrigger' -ScriptBlock $ScriptBlock -Tag 'engine' -Module 'MyModule' -Level Warning
```

Registers an event subscription ...
- Under the name 'Mymodule.OffloadTrigger' ...
- To execute $ScriptBlock ...
- Whenever a message is written with the tag 'engine' by the module 'MyModule' at the level 'Warning'

## PARAMETERS

### -Name
The name of the subscription.
Each subscription must have a name, subscriptions of equal name will overwrite each other.
This is in order to avoid having runspace uses explode the number of subscriptions on each invocation.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
The scriptblock to execute.
It will receive the message entry (as returned by Get-PSFMessage) as its sole argument.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessageFilter
Filter by message content.
Understands wildcards, but not regex.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleNameFilter
Filter by Name of the module, from which the message comes.
Understands wildcards, but not regex.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FunctionNameFilter
Filter by Name of the function, from which the message comes.
Understands wildcards, but not regex.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetFilter
Filter by target object.
Performs equality comparison on an object level.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LevelFilter
Include only messages of the specified levels.

```yaml
Type: MessageLevel[]
Parameter Sets: (All)
Aliases:
Accepted values: Critical, Important, Output, Host, Significant, VeryVerbose, Verbose, SomewhatVerbose, System, Debug, InternalComment, Warning, Error

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TagFilter
Only include messages with any of the specified tags.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RunspaceFilter
Only include messages which were written by the specified runspace.
You can find out the current runspace ID by running this:
  \[System.Management.Automation.Runspaces.Runspace\]::DefaultRunspace.InstanceId
You can retrieve the primary runspace - the Guid used by the runspace the user sees - by running this:
  \[PSFramework.Utility.UtilityHost\]::PrimaryRunspace

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
