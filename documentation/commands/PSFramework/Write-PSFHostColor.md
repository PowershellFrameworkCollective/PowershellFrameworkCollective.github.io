---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Write-PSFHostColor

## SYNOPSIS
Function that recognizes html-style tags to insert color into printed text.

## SYNTAX

```
Write-PSFHostColor [[-String] <String[]>] [[-DefaultColor] <ConsoleColor>] [-NoNewLine]
 [[-Level] <MessageLevel>] [<CommonParameters>]
```

## DESCRIPTION
Function that recognizes html-style tags to insert color into printed text.

Color tags should be designed to look like this:
\<c="\<console color\>"\>Text\</c\>
For example this would be a valid string:
"This message should \<c="red"\>partially be painted in red\</c\>!"

This allows specifying color within strings and avoids having to piece together colored text in multiple calls to Write-Host.
Only colors that are part of the ConsoleColor enumeration can be used.
Bad colors will be ignored in favor of the default color.

## EXAMPLES

### EXAMPLE 1
```
bloody red</c> text! And this is <c="green">green stuff</c> for extra color'
```

Will print the specified line in multiple colors

### EXAMPLE 2
```
bloody red</c> text! And this is <c="green">green stuff</c> for extra color'
```

$string2 = '\<c="red"\>bloody red\</c\> text!
And this is \<c="green"\>green stuff\</c\> for extra color'
$string3 = 'This is going to be \<c="red"\>bloody red\</c\> text!
And this is \<c="green"\>green stuff\</c\>'
$string1, $string2, $string3 | Write-PSFHostColor -DefaultColor "Magenta"

Will print all three lines, respecting the color-codes, but use the color "Magenta" as default color.

### EXAMPLE 3
```
$stringLong = @"
```

Dear \<c="red"\>Sirs\</c\>\<c="green"\> and\</c\> \<c="blue"\>Madams\</c\>,

it has come to our attention that you are not sufficiently \<c="darkblue"\>awesome!\</c\>
Kindly improve your \<c="yellow"\>AP\</c\> (\<c="magenta"\>awesome-ness points\</c\>) by at least 50% to maintain you membership in Awesome Inc!

You have \<c="green"\>27 3/4\</c\> days time to meet this deadline.
\<c="darkyellow"\>After this we will unfortunately be forced to rend you assunder and sacrifice your remains to the devil\</c\>.

Best regards,
\<c="red"\>Luzifer\</c\>
"@
Write-PSFHostColor -String $stringLong

Will print a long multiline text in its entirety while still respecting the colorcodes

## PARAMETERS

### -String
The message to write to host.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DefaultColor
Default: (Get-DbaConfigValue -Name "message.infocolor")
The color to write stuff to host in when no (or bad) color-code was specified.

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: 2
Default value: (Get-PSFConfigValue -FullName "psframework.message.info.color")
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoNewLine
Specifies that the content displayed in the console does not end with a newline character.

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

### -Level
By default, all messages to Write-PSFHostColor will be printed to host.
By specifying a level, it will only print the text if that level is within the range visible to the user.

Visibility is controlled by the following two configuration settings:
  psframework.message.info.maximum
  psframework.message.info.minimum

```yaml
Type: MessageLevel
Parameter Sets: (All)
Aliases:
Accepted values: Critical, Important, Output, Host, Significant, VeryVerbose, Verbose, SomewhatVerbose, System, Debug, InternalComment, Warning, Error

Required: False
Position: 3
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
