---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUShell

## SYNOPSIS
Command that sets various console properties

## SYNTAX

```
Set-PSUShell [[-WindowWidth] <Int32>] [[-BackgroundColor] <ConsoleColor>] [[-ForegroundColor] <ConsoleColor>]
 [[-BufferLength] <Int32>] [[-WindowTitle] <String>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Command that sets various console properties.

## EXAMPLES

### EXAMPLE 1
```
Set-PSUShell -WindowWidth 140 -WindowTitle "The Foo Shell" -ForegroundColor DarkGreen -BackgroundColor Black
```

Sets the current shell to ...
- 140 pixel width
- have a title of "The Foo Shell"
- Use a foreground color of DarkGreen for all output, default prompt color and comment color (PSReadline syntax detection remains unaffected)
- Use a background color of Black

## PARAMETERS

### -WindowWidth
The width of the console window.
Not much of a change on windows 10, more of a chore on older console hosts.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackgroundColor
The background color to use.
Is PSReadline aware.

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForegroundColor
The foreground color to use.
Is PSReadline aware.

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BufferLength
How lengthy a memory the console screen keeps.
The size of the stuff cls clears.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowTitle
The title the window should have.

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

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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
