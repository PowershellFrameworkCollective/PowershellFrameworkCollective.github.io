---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Read-PSUKnowledge

## SYNOPSIS
Searches for knowledge.

## SYNTAX

```
Read-PSUKnowledge [[-Name] <String>] [-Tags <String[]>] [-Pattern <String>] [-Book <String>] [-Online]
 [<CommonParameters>]
```

## DESCRIPTION
Searches for knowledge.
Generally, knowledge must first be generated using Write-PSUKnowledge.
This allows these functions to server as a searchable notes section right within your console.

However, there might be some other ways to seek knowledge ...

## EXAMPLES

### EXAMPLE 1
```
Read-PSUKnowledge
```

Lists all knowledge entries.

### EXAMPLE 2
```
Read-PSUKnowledge -Tags DNS
```

Lists all knowledge entries with the tag "DNS"

### EXAMPLE 3
```
read -p ldap
```

Lists all knowledge entries with the string "ldap" in name or text.

## PARAMETERS

### -Name
The name of the knowledge entry.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Page

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Tags to search by.
At least one of the specified tags must be contained.

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

### -Pattern
Search Name and text of the page by using this regex pattern.

```yaml
Type: String
Parameter Sets: (All)
Aliases: p, f, filter

Required: False
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### -Book
The book to search in.
By default you only have one and don't need to worry about this.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Online
Mysterious parameter.
I wonder what it does ...

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
