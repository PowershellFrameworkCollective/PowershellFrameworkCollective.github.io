---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDEncoding

## SYNOPSIS
Sets the encoding for the input file.

## SYNTAX

```
Set-PSMDEncoding [-Path] <String[]> [[-Encoding] <EncodingParameter>] [-EnableException] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This command reads the input file using the default encoding interpreter.
It then writes the contents as the specified enconded string back to itself.

There is no inherent encoding conversion enacted, so special characters may break.
This is a tool designed to reformat code files, where special characters shouldn't be used anyway.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem -Recurse | Set-PSMDEncoding
```

Converts all files in the current folder and subfolders to UTF8

## PARAMETERS

### -Path
Path to the files to be set.
Silently ignores folders.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Encoding
The encoding to set to (Defaults to "UTF8 with BOM")

```yaml
Type: EncodingParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-PSFConfigValue -FullName 'psframework.text.encoding.defaultwrite' -Fallback 'utf-8')
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

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
