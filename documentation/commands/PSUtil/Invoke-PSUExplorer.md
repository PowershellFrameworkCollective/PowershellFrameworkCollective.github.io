---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Invoke-PSUExplorer

## SYNOPSIS
Opens the windows explorer at the specified position.

## SYNTAX

```
Invoke-PSUExplorer [[-Path] <String[]>] [-Module <PSModuleInfo[]>] [-Duplicates] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Opens the windows explorer at the specified position.

## EXAMPLES

### EXAMPLE 1
```
dir | Explorer
```

Opens each folder in the current directory in a separate explorer Window.

## PARAMETERS

### -Path
Alias:   FullName
Default: (Get-Location).Path
The folder to open in explorer.
If a file was passed the containing folder will be opened instead.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName

Required: False
Position: 1
Default value: (Get-Location).ProviderPath
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Module
The module, the base folder of which should be opened.

```yaml
Type: PSModuleInfo[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Duplicates
Setting this switch will cause the function to open the same folder multiple times, if it was passed multiple times.
By default, the function will not open the same folder multiple times (a dir of a directory with multiple files would otherwise cause multiple open windows).

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
