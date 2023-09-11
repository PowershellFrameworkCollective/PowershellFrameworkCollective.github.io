---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFMessageColorTransform

## SYNOPSIS
Adds a rule that changes the color of messages when applicable.

## SYNTAX

### default (Default)
```
Register-PSFMessageColorTransform -Name <String> -Color <ConsoleColor> [-Priority <Int32>]
 [-IncludeTags <String[]>] [-ExcludeTags <String[]>] [-IncludeModules <String[]>] [-ExcludeModules <String[]>]
 [-IncludeFunctions <String[]>] [-ExcludeFunctions <String[]>] [<CommonParameters>]
```

### Level
```
Register-PSFMessageColorTransform -Name <String> -Color <ConsoleColor> [-Priority <Int32>]
 [-Level <MessageLevel>] [-IncludeTags <String[]>] [-ExcludeTags <String[]>] [-IncludeModules <String[]>]
 [-ExcludeModules <String[]>] [-IncludeFunctions <String[]>] [-ExcludeFunctions <String[]>]
 [<CommonParameters>]
```

### Range
```
Register-PSFMessageColorTransform -Name <String> -Color <ConsoleColor> [-Priority <Int32>] [-MinLevel <Int32>]
 [-MaxLevel <Int32>] [-IncludeTags <String[]>] [-ExcludeTags <String[]>] [-IncludeModules <String[]>]
 [-ExcludeModules <String[]>] [-IncludeFunctions <String[]>] [-ExcludeFunctions <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION
Adds a rule that changes the color of messages when applicable.
This only affects messages that are shown to the user through the information levels.
Verbose messages, debug messages or waranings are unaffected, as their color is determined by the system.

Inline color assignments beat this color transformation.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFMessageColorTransform -Name 'PSFramework.Critical' -IncludeModules PSFramework -Level Critical -Color Magenta
```

Critical messages written from any command in PSFramework will be written in Magenta by default.

## PARAMETERS

### -Name
Name of the rule.
Must be unique and should tell the user where it comes from.

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

### -Color
The color to apply to the message.

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
The priority of a color assignment determines, which rule wins when multiple registered transformation rules apply.
The lower the number, the higher the precedence and the better the chance for the color to apply.
Defaults to: 50

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 50
Accept pipeline input: False
Accept wildcard characters: False
```

### -Level
Applies only to messages of the specified level

```yaml
Type: MessageLevel
Parameter Sets: Level
Aliases:
Accepted values: Critical, Important, Output, Host, Significant, VeryVerbose, Verbose, SomewhatVerbose, System, Debug, InternalComment, Warning, Error

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinLevel
Applies to all messages that have at least this level.
Note: The lower the level, the higher the default visibility.
Users usually see levels 1-3.

```yaml
Type: Int32
Parameter Sets: Range
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxLevel
Applies to all messages that have no higher level than this.
Note: The lower the level, the higher the default visibility.
Users usually see levels 1-3.

```yaml
Type: Int32
Parameter Sets: Range
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeTags
A message must contain at least one of these tags in order to be colored.

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

### -ExcludeTags
A message may not contain any of these tags in order to be colored.

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

### -IncludeModules
A message must come from one of these modules in order to be colored.

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

### -ExcludeModules
A message must not come from one of these modules in order to be colored.

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

### -IncludeFunctions
A message must come from one of these functions in order to be colored.

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

### -ExcludeFunctions
A message must not come from one of these functions in order to be colored.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
