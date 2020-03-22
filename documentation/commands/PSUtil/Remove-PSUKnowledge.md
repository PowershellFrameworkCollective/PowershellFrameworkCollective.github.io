---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Remove-PSUKnowledge

## SYNOPSIS
Removes pages from the books of your holy console library of knowledge.

## SYNTAX

```
Remove-PSUKnowledge [-Name] <String[]> [[-Book] <String>] [<CommonParameters>]
```

## DESCRIPTION
Removes pages from the books of your holy console library of knowledge.
Contribute new knowledge by using Write-PSUKnowledge or search it by using Read-PSUKnowlege.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSUKnowledge -Name 'DNS for Dummies'
```

Rips out the page 'DNS for Dummies' from your default book.

## PARAMETERS

### -Name
The name of the page to rip out.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: page

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Book
The book of knowledge to deface.
Defaults to the book specified under the 'PSUtil.Knowledge.DefaultBook' configuration setting.
It will look for books in your library path, which can be specified under 'PSUtil.Knowledge.LibraryPath'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-PSFConfigValue -FullName 'PSUtil.Knowledge.DefaultBook')
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
