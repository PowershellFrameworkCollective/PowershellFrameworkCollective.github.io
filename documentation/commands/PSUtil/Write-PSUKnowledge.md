---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Write-PSUKnowledge

## SYNOPSIS
Writes a piece of knowledge into the designated book.

## SYNTAX

```
Write-PSUKnowledge [-Name] <String> [-Text] <String> [[-Tags] <String[]>] [[-Book] <String>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Writes a piece of knowledge into the designated book.
This can be later retrieved using Read-PSUKnowledge.

"Books" are an arbitrary label grouping one or multiple pieces of text ("pages").
You could separate them by category (e.g.
"Active Directory" or "Exchagne Online") or by computer (e.g.
"Desktop", "Notebook", ...).

## EXAMPLES

### EXAMPLE 1
```
Set-PSUKnowledge -Name 'DNS Queries' -Text $nslookupExplained -Tags dns, network, infrastructure
```

Defines a new page named "DNS Queries" with the text contained in $nslookupExplained.
It also adds a few tags to make searching for it later easier.

## PARAMETERS

### -Name
The name of the page to write.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Text
The page / text to write.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Page

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Tags
Additional tags to include.
Tags help find content later on.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Book
The book to write the content to.
Defaults to the book specified under the 'PSUtil.Knowledge.DefaultBook' configuration setting.
It will look for books in your library path, which can be specified under 'PSUtil.Knowledge.LibraryPath'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-PSFConfigValue -FullName 'PSUtil.Knowledge.DefaultBook')
Accept pipeline input: True (ByPropertyName)
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
