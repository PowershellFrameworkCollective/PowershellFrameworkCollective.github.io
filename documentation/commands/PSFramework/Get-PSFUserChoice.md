---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFUserChoice

## SYNOPSIS
Prompts the user to choose between a set of options.

## SYNTAX

```
Get-PSFUserChoice [-Options] <Object[]> [[-Caption] <String>] [-Vertical] [[-Message] <String>]
 [[-DefaultChoice] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Prompts the user to choose between a set of options.
Returns the index of the choice picked as a number.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFUserChoice -Options "1) Create a new user", "2) Disable a user", "3) Unlock an account", "4) Get a cup of coffee", "5) Exit" -Caption "User administration menu" -Message "What operation do you want to perform?"
```

Prompts the user for what operation to perform from the set of options provided

## PARAMETERS

### -Options
The options the user may pick from.
The user selects a choice by specifying the letter associated with a choice.
The letter assigned to a choice is picked from the character after the first '&' in any specified string.
If there is no '&', the system will automatically pick the first letter as choice letter:
"This &is an example" will have the character "i" bound for the choice.
"This is &an example" will have the character "a" bound for the choice.
"This is an example" will have the character "T" bound for the choice.

This parameter takes both strings and hashtables (in any combination).
A hashtable is expected to have two properties, 'Label' and 'Help'.
Label is the text shown in the initial prompt, help what the user sees when requesting help.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Caption
The title of the question, so the user knows what it is all about.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Vertical
Displays the options vertically, one per line, rather than the default side-by-side display.
Each option will be numbered.
Option numbering starts at 1, return will always be one lower than the selected number.

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

### -Message
A message to offer to the user.
Be more specific about the implications of this choice.

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

### -DefaultChoice
The index of the choice made by default.
By default, the first option is selected as default choice.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Int32
## NOTES

## RELATED LINKS
