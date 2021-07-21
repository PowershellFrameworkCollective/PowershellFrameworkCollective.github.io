---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDHelp

## SYNOPSIS
Displays localized information about Windows PowerShell commands and concepts.

## SYNTAX

### AllUsersView (Default)
```
Get-PSMDHelp [-Full] [-Category <String[]>] [-Component <String[]>] [[-Name] <String>] [[-Language] <String>]
 [-SetLanguage <String>] [-Path <String>] [-Functionality <String[]>] [-Role <String[]>] [<CommonParameters>]
```

### Parameters
```
Get-PSMDHelp -Parameter <String> [-Category <String[]>] [-Component <String[]>] [[-Name] <String>]
 [[-Language] <String>] [-SetLanguage <String>] [-Path <String>] [-Functionality <String[]>] [-Role <String[]>]
 [<CommonParameters>]
```

### Online
```
Get-PSMDHelp [-Online] [-Category <String[]>] [-Component <String[]>] [[-Name] <String>] [[-Language] <String>]
 [-SetLanguage <String>] [-Path <String>] [-Functionality <String[]>] [-Role <String[]>] [<CommonParameters>]
```

### ShowWindow
```
Get-PSMDHelp [-ShowWindow] [-Category <String[]>] [-Component <String[]>] [[-Name] <String>]
 [[-Language] <String>] [-SetLanguage <String>] [-Path <String>] [-Functionality <String[]>] [-Role <String[]>]
 [<CommonParameters>]
```

### DetailedView
```
Get-PSMDHelp [-Detailed] [-Category <String[]>] [-Component <String[]>] [[-Name] <String>]
 [[-Language] <String>] [-SetLanguage <String>] [-Path <String>] [-Functionality <String[]>] [-Role <String[]>]
 [<CommonParameters>]
```

### Examples
```
Get-PSMDHelp [-Examples] [-Category <String[]>] [-Component <String[]>] [[-Name] <String>]
 [[-Language] <String>] [-SetLanguage <String>] [-Path <String>] [-Functionality <String[]>] [-Role <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION
The Get-PSMDHelp function is a wrapper around get-help that allows localizing help queries.
This is especially useful when developing modules with help in multiple languages.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDHelp Get-Help "en-us" -Detailed
```

Gets the detailed help text of Get-Help in English

## PARAMETERS

### -Parameter
Displays only the detailed descriptions of the specified parameters.
Wildcards are permitted.

This parameter has no effect on displays of conceptual ("About_") help.

```yaml
Type: String
Parameter Sets: Parameters
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Online
Displays the online version of a help topic in the default Internet browser.
This parameter is valid only for
cmdlet, function, workflow and script help topics.
You cannot use the Online parameter in Get-Help commands in
a remote session.

For information about supporting this feature in help topics that you write, see about_Comment_Based_Help
(http://go.microsoft.com/fwlink/?LinkID=144309), and "Supporting Online Help"
(http://go.microsoft.com/fwlink/?LinkID=242132), and "How to Write Cmdlet Help"
(http://go.microsoft.com/fwlink/?LinkID=123415) in the MSDN (Microsoft Developer Network) library.

```yaml
Type: SwitchParameter
Parameter Sets: Online
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowWindow
Displays the help topic in a window for easier reading.
The window includes a "Find" search feature and a
"Settings" box that lets you set options for the display, including options to display only selected sections
of a help topic.

The ShowWindow parameter supports help topics for commands (cmdlets, functions, CIM commands, workflows,
scripts) and conceptual "About" topics.
It does not support provider help.

This parameter is introduced in Windows PowerShell 3.0.

```yaml
Type: SwitchParameter
Parameter Sets: ShowWindow
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Full
Displays the entire help topic for a cmdlet, including parameter descriptions and attributes, examples, input and output object types, and additional notes.

This parameter is effective only when help files are for the command are installed on the computer.
It has no effect on displays of conceptual ("About_") help.

```yaml
Type: SwitchParameter
Parameter Sets: AllUsersView
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Detailed
Adds parameter descriptions and examples to the basic help display.

This parameter is effective only when help files are for the command are installed on the computer.
It has no effect on displays of conceptual ("About_") help.

```yaml
Type: SwitchParameter
Parameter Sets: DetailedView
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Examples
Displays only the name, synopsis, and examples.
To display only the examples, type "(Get-PSMDHelpEx \<cmdlet-name\>).Examples".

This parameter is effective only when help files are for the command are installed on the computer.
It has no effect on displays of conceptual ("About_") help.

```yaml
Type: SwitchParameter
Parameter Sets: Examples
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Displays help only for items in the specified category and their aliases.
Valid values are Alias, Cmdlet,
Function, Provider, Workflow, and HelpFile.
Conceptual topics are in the HelpFile category.

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

### -Component
Displays commands with the specified component value, such as "Exchange." Enter a component name.
Wildcards are permitted.

This parameter has no effect on displays of conceptual ("About_") help.

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

### -Name
Gets help about the specified command or concept.
Enter the name of a cmdlet, function, provider, script, or
workflow, such as "Get-Member", a conceptual topic name, such as "about_Objects", or an alias, such as "ls".
Wildcards are permitted in cmdlet and provider names, but you cannot use wildcards to find the names of
function help and script help topics.

To get help for a script that is not located in a path that is listed in the Path environment variable, type
the path and file name of the script .

If you enter the exact name of a help topic, Get-Help displays the topic contents.
If you enter a word or word
pattern that appears in several help topic titles, Get-Help displays a list of the matching titles.
If you
enter a word that does not match any help topic titles, Get-Help displays a list of topics that include that
word in their contents.

The names of conceptual topics, such as "about_Objects", must be entered in English, even in non-English versions of Windows PowerShell.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Language
Set the language of the help returned.
Use 5-digit language codes such as "en-us" or "de-de".
Note: If PowerShell does not have help in the language specified, it will either return nothing or default back to English

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

### -SetLanguage
Sets the language of the current and all subsequent help queries.
Use 5-digit language codes such as "en-us" or "de-de".
Note: If PowerShell does not have help in the language specified, it will either return nothing or default back to English

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

### -Path
Gets help that explains how the cmdlet works in the specified provider path.
Enter a Windows PowerShell provider path.

This parameter gets a customized version of a cmdlet help topic that explains how the cmdlet works in the
specified Windows PowerShell provider path.
This parameter is effective only for help about a provider cmdlet
and only when the provider includes a custom version of the provider cmdlet help topic  in its help file.
To
use this parameter, install the help file for the module that includes the provider.

To see the custom cmdlet help for a provider path, go to the provider path location and enter a Get-Help
command or, from any path location, use the Path parameter of Get-Help to specify the provider path.
You can
also find custom cmdlet help online in the provider help section of the help topics.
For example, you can find
help for the New-Item cmdlet in the Wsman:\*\ClientCertificate path
(http://go.microsoft.com/fwlink/?LinkID=158676).

For more information about Windows PowerShell providers, see about_Providers
(http://go.microsoft.com/fwlink/?LinkID=113250).

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

### -Functionality
Displays help for items with the specified functionality.
Enter the functionality.
Wildcards are permitted.

This parameter has no effect on displays of conceptual ("About_") help.

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

### -Role
Displays help customized for the specified user role.
Enter a role.
Wildcards are permitted.

Enter the role that the user plays in an organization.
Some cmdlets display different text in their help files
based on the value of this parameter.
This parameter has no effect on help for the core cmdlets.

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
