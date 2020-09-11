---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Convert-PSMDMessage

## SYNOPSIS
Converts a file's use of PSFramework messages to strings.

## SYNTAX

```
Convert-PSMDMessage [-Path] <String> [-OutPath] <String> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Converts a file's use of PSFramework messages to strings.

## EXAMPLES

### EXAMPLE 1
```
Convert-PSMDMessage -Path 'C:\Scripts\logrotate.ps1' -OutPath 'C:\output'
```

Converts all instances of writing messages in logrotate.ps1 to use strings instead.

## PARAMETERS

### -Path
Path to the file to convert.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
Folder in which to generate the output ps1 and psd1 file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
