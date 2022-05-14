---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFTempItem

## SYNOPSIS
Creates a temporary item

## SYNTAX

```
New-PSFTempItem [-Name] <String> [-ProviderName] <String> [-Data] <Hashtable> [[-Timeout] <DateTimeParameter>]
 [[-ModuleName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a temporary item.
This is a generically extensible item that requires a provider - a plugin - that determines what it actually means.
Depending on the implementation, this could be a temporary user account, a temporary database, a temporary ...
anything.

Use Register-PSFTempProvider to define a temporary item provider.

## EXAMPLES

### EXAMPLE 1
```
New-PSFTempItem -Name 'userA' -ProviderName 'aduser' -Data @{ OU = 'OU=TempUser,OU=Company,DC=Contoso,DC=com' }
```

Create a temporary AD user named userA.
Requires a temporary item provider named aduser.

## PARAMETERS

### -Name
The name of the temporary item.
Used for identifying the item, but need not be particularly unique otherwise.

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

### -ProviderName
Name of the provider implementing the actual logic.
Use Register-PSFTempProvider to define one.

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

### -Data
The information needed to generate the temporary item.
What information is needed by the provider depends on the provider implementation itself.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
How long into the future this item is valid.
Expired temporary items can be conveniently cleaned up using Remove-PSFTempItem.

```yaml
Type: DateTimeParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleName
Name of the module the temp item belongs to.
If called from within a module, this value will be detected automatically and needs not be specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: [PSFramework.Utility.UtilityHost]::GetCallerInfo(1).CallerModule
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
