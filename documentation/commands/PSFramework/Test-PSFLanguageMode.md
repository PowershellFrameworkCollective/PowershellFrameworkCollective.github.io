---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFLanguageMode

## SYNOPSIS
Tests, in what language mode a specified scriptblock is in.

## SYNTAX

```
Test-PSFLanguageMode [-ScriptBlock] <ScriptBlock> [[-Mode] <PSLanguageMode[]>] [-Not] [<CommonParameters>]
```

## DESCRIPTION
Tests, in what language mode a specified scriptblock is in.
Use this to determine the trustworthyness of a scriptblock, or for insights, into what its capabilities are.

## EXAMPLES

### EXAMPLE 1
```
Test-PSFLanguageMode -ScriptBlock $ScriptBlock
```

Returns, whether the $Scriptblock is in FullLanguage mode.

### EXAMPLE 2
```
Test-PSFLanguageMode -ScriptBlock $code -Mode ConstrainedLanguage -Not
```

Returns $true if the specified scriptblock is NOT inconstrained language mode.

## PARAMETERS

### -ScriptBlock
The scriptblock to test.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode
The Languagemode(s) to compare it to.
The scriptblock must be in one of the specified modes.
Defaults to 'FullLanguage'

```yaml
Type: PSLanguageMode[]
Parameter Sets: (All)
Aliases:
Accepted values: FullLanguage, RestrictedLanguage, NoLanguage, ConstrainedLanguage

Required: False
Position: 2
Default value: FullLanguage
Accept pipeline input: False
Accept wildcard characters: False
```

### -Not
Reverses the test results - now the scriptblock may NOT be in one of the specified language modes.

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

### System.Boolean
## NOTES

## RELATED LINKS
