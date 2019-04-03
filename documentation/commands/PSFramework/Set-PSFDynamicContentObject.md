---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFDynamicContentObject

## SYNOPSIS
Updates a value object that can easily be accessed on another runspace.

## SYNTAX

### Value
```
Set-PSFDynamicContentObject [-Name <String[]>] [-Object <DynamicContentObject[]>] -Value <Object> [-PassThru]
 [-Reset] [<CommonParameters>]
```

### Queue
```
Set-PSFDynamicContentObject [-Name <String[]>] [-Object <DynamicContentObject[]>] [-Queue] [-PassThru] [-Reset]
 [<CommonParameters>]
```

### Stack
```
Set-PSFDynamicContentObject [-Name <String[]>] [-Object <DynamicContentObject[]>] [-Stack] [-PassThru] [-Reset]
 [<CommonParameters>]
```

### List
```
Set-PSFDynamicContentObject [-Name <String[]>] [-Object <DynamicContentObject[]>] [-List] [-PassThru] [-Reset]
 [<CommonParameters>]
```

### Dictionary
```
Set-PSFDynamicContentObject [-Name <String[]>] [-Object <DynamicContentObject[]>] [-Dictionary] [-PassThru]
 [-Reset] [<CommonParameters>]
```

## DESCRIPTION
Updates a value object that can easily be accessed on another runspace.

The Dynamic Content Object system allows the user to easily have the content of a variable updated in the background.
The update is performed by this very function.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFDynamicContentObject -Name Test -Value $Value
```

Sets the Dynamic Content Object named "test" to the value $Value.

### EXAMPLE 2
```
Set-PSFDynamicContentObject -Name MyModule.Value -Queue
```

Sets the Dynamic Content Object named "MyModule.Value" to contain a threadsafe queue.
This queue will be safe to enqueue and dequeue from, no matter the number of runspaces accessing it simultaneously.

## PARAMETERS

### -Name
The name of the value to update.
Not case sensitive.

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

### -Object
The value object to update

```yaml
Type: DynamicContentObject[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Value
The value to apply

```yaml
Type: Object
Parameter Sets: Value
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Queue
Set the object to be a threadsafe queue.
Safe to use in multiple runspaces in parallel.
Will not apply changes if the current value is already such an object.

```yaml
Type: SwitchParameter
Parameter Sets: Queue
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stack
Set the object to be a threadsafe stack.
Safe to use in multiple runspaces in parallel.
Will not apply changes if the current value is already such an object.

```yaml
Type: SwitchParameter
Parameter Sets: Stack
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -List
Set the object to be a threadsafe list.
Safe to use in multiple runspaces in parallel.
Will not apply changes if the current value is already such an object.

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

### -Dictionary
Set the object to be a threadsafe dictionary.
Safe to use in multiple runspaces in parallel.
Will not apply changes if the current value is already such an object.

```yaml
Type: SwitchParameter
Parameter Sets: Dictionary
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Has the command returning the object just set.

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

### -Reset
Clears the dynamic content object's collection objects.
Use this to ensure the collection is actually empty.
Only used in combination of either -Queue, -Stack, -List or -Dictionary.

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

### PSFramework.Utility.DynamicContentObject
## NOTES

## RELATED LINKS
