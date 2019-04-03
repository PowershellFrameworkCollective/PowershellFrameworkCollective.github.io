---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFMessageLevelModifier

## SYNOPSIS
Allows modifying message levels by powerful filters.

## SYNTAX

```
New-PSFMessageLevelModifier [-Name] <String> [-Modifier] <Int32> [[-IncludeFunctionName] <String>]
 [[-ExcludeFunctionName] <String>] [[-IncludeModuleName] <String>] [[-ExcludeModuleName] <String>]
 [[-IncludeTags] <String[]>] [[-ExcludeTags] <String[]>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Allows modifying message levels by powerful filters.

This is designed to allow a developer to have more control over what is written how during the development process.
It also allows a debug user to fine tune what he is shown.

This functionality is NOT designed for default implementation within a module.
Instead, set healthy message levels for your own messages and leave others to tend to their own levels.

Note:
Adding too many level modifiers may impact performance, use with discretion.

## EXAMPLES

### EXAMPLE 1
```
New-PSFMessageLevelModifier -Name 'MyModule-Include' -Modifier -9 -IncludeModuleName MyModule
```

PS C:\\\> New-PSFMessageLevelModifier -Name 'MyModule-Exclude' -Modifier 9 -ExcludeModuleName MyModule

These settings will cause all messages from the module 'MyModule' to be highly prioritized and almost certainly written to host.
It will also make it highly unlikely, that messages from other modules will even be considered for anything but the lowest level.

This is useful when prioritizing your own module during development.

## PARAMETERS

### -Name
The name of the level modifier.
Can be arbitrary, but must be unique.
Not case sensitive.

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

### -Modifier
The level modifier to apply.
- Use a negative value to make a message more relevant
- Use a positive value to make a message less relevant
While not limited to this range, the original levels range from 1 through 9:
- 1-3 : Written to host and debug by default
- 4-6 : Written to verbose and debug by default
- 7-9 : Internas, written only to debug

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeFunctionName
Only messages from functions with one of these exact names will be considered.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeFunctionName
Messages from functions with one of these exact names will be ignored.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeModuleName
Only messages from modules with one of these exact names will be considered.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeModuleName
Messages from module with one of these exact names will be ignored.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeTags
Only messages that contain one of these tags will be considered.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeTags
Messages that contain one of these tags will be ignored.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
