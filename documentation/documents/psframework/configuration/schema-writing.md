---
title: configuration: Writing a Schema
---

# Writing a Schema

[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

## Synopsis

A configuration schema is a definition for how an input file needs to look in order to be read by `Import-PSFConfig`.
Creating your own schema thus allows you to define your own configuration file layout, as well as its processing logic.

## Description

You create your own schema by defining the processing scriptcode and registering using `Register-PSFConfigSchema`:

```powershell
Register-PSFConfigSchema -Name SchemaName -Schema $scriptblock
```

But what exactly needs to go into one of those scriptblocks?

### Built-in Schemata

A couple of schemata are available out-of-the-box:

|[Default](schema-default.html)|The simple default schema, designed to understand the output of Export-PSFConfig|
|[MetaJson](schema-metajson.html)|Advanced Json format, easy to author for a human, very flexible, supports hierarchical processing of multiple files that can react to the environment|

Before deciding to implement your own, give those a look and see whether they will do for your purposes.

### Parameters / Input

Your scriptblock will receive two arguments:

+ Resource
+ Settings

Resource can be:

+ A path to a file
+ A weblink
+ The actual text content to parse

Settings are the passed through parameters from `Import-PSFConfig` plus a few other pieces of information that can be useful when processing the configuration file.

An example parameter block for your own schema would thus be:

```powershell
param (
    [string]
    $Resource,

    [System.Collections.Hashtable]
    $Settings
)

#region Converting parameter settings
$Peek = $Settings["Peek"]
$AllowDelete = $Settings["AllowDelete"]
$PassThru = $Settings["PassThru"]
$ExcludeFilter = $Settings["ExcludeFilter"]
$IncludeFilter = $Settings["IncludeFilter"]
$EnableException = $Settings["EnableException"]
$Cmdlet = $Settings["Cmdlet"]
$CurrentPath = $Settings["Path"]
#endregion Converting parameter settings
```

Respecting these settings is your own responsibility and is strongly encouraged to offer a consistent user experience.
What exactly that means and how to do so is much of the rest of this document.

### Processing the file

The actual processing is your own responsibility and there is little help this guide can offer.
That said, you will need to generate the fullname and the intended value for each setting read.

You can use all the tools the `PSFramework` has to offer, or use external tools or modules.
Note, the configuration schema system does not include any dependency handling, so you are responsible for making sure you have the needed tools at hand.

> Breaking the Change

With these schemata, one easy trap to fall into is assuming perfection.
Odds are, that while the current implementation looks great (after spending lots of sweat and blood on it), you will need to update it in the future.

Providing a mechanism in your configuration schema for the file to tell you which schema version it is is _strongly_ encouraged.
This way you can provide backwards compatibility when updating the format.

> Notes on going forward

whatever your code does to generate configuration data from the input file, examples later in this documentation will assume you stored the results in `$configurationItems` and that each object contains two properties: `FullName` and `Value`.

### Taking a Peek

The `$Peek` setting indicates that the user wants to load the file _without_ actually applying the settings.
If this is true, you should not call `Set-PSFConfig` and instead just return the objects in `$configurationItems`.

```powershell
foreach ($configItem in $configurationItems)
{
    # ...
    if ($Peek)
    {
        $configItem
        continue
    }
    # ...
}
```

### Allowing Deletion & Passing Through

The settings `$AllowDelete` and `$PassThru` are intended directly for the `Set-PSFConfig` call:

+ AllowDelete enables the user later to actually [delete the configuration objects](deleting-settings.html), which is not generally intended for the configuration system.
+ PassThru will apply the configuration settings and then pass on the configuration objects. This is most frequently used by users that want to [persist](persistence-basics.html) the configuration while loading it.

With that, all you really need to do is pass them through to `Set-PSFConfig`:

```powershell
foreach ($configItem in $configurationItems)
{
    # ...
    Set-PSFConfig -FullName $configItem.FullName -Value $configItem.Value -AllowDelete:$AllowDelete -PassThru:$PassThru
}
```

### Including and Excluding

The settings `$ExcludeFilter` and `$IncludeFilter` are wildcard-based filter patterns applied to the fullname of each setting.

> Each of these settings are string _arrays_ and thus can have more than one filter strings.

Basically ...

+ If any of the ExcludeFilter is like the fullname of a setting it should be skipped
+ If any IncludeFilter is defined, only settings whose fullname is like at least one of them should be applied
+ If a fullname is like both an IncludeFilter and an ExcludeFilter, exclude wins

```powershell
foreach ($configItem in $configurationItems)
{
    if ($ExcludeFilter | Where-Object { $configItem.FullName -like $_ }) { continue }
    if ($IncludeFilter -and -not ($IncludeFilter | Where-Object { $configItem.FullName -like $_ })) { continue }
    # ...
}
```

### Error handling

The settings `$EnableException` and `$Cmdlet` are designed to help you with your error handling.
The configuration system is - among other things - expected to be used directly be the end user.
As such it implements the [Opt-In Exception workflow](../flow-control/opt-in-exceptions.html).

Your schema code is expected to handle errors gracefully, whether you cannot read the file or the layout is incorrect.
As such you should use `Stop-PSFFunction` for your error handling, passing through these two variables.

+ EnableException controls whether the user sees a friendly warning ($false) or the red of a terminating exception ($true).
+ Cmdlet contains the $PSCmdlet variable of `Import-PSFConfig`. It is used in case `$EnableException` is $true to fail in the context of the calling command, rather than your scriptblock.

Example:

```powershell
switch ($importData.Version)
{
    1 {
        $configurationItems = $importData.Content | ConvertFrom-MyDataFormatV1
    }
    default
    {
        Stop-PSFFunction -Message "Unknown schema version: $($importData.Version)" -ModuleName MyModule -FunctionName 'Schema: MySchemaName' -EnableException $EnableException -Cmdlet $Cmdlet
        return
    }
}
```

### The current path

Finally, the `$CurrentPath` setting gives you the current location of the caller, which might be different from your own scriptblock one, depending on execution context or some other edge-cases.

If your code for whatever reason needs to be current-location aware, you can thus know it and use `Push-Location` and `Pop-Location` to step into that path for the duration of the import.

That said, it's more of a contingency and generally not needed.

## Putting things together

With the previous bits covered, here is a full template, just missing your processing logic:

```powershell
Register-PSFConfigSchema -Name SchemaName -Schema {
    param (
        [string]
        $Resource,

        [System.Collections.Hashtable]
        $Settings
    )

    #region Converting parameter settings
    $Peek = $Settings["Peek"]
    $AllowDelete = $Settings["AllowDelete"]
    $PassThru = $Settings["PassThru"]
    $ExcludeFilter = $Settings["ExcludeFilter"]
    $IncludeFilter = $Settings["IncludeFilter"]
    $EnableException = $Settings["EnableException"]
    $Cmdlet = $Settings["Cmdlet"]
    $CurrentPath = $Settings["Path"]
    #endregion Converting parameter settings

    #region Utility Functions
    # Your code goes here
    #endregion Utility Functions

    #region Process Data
    $importData = Read-Resource -Resource $Resource
    $configurationItems = switch ($importData.Version) {
        1 {
            $importData.Content | ConvertFrom-MyDataFormatV1
        }
        default {
            Stop-PSFFunction -Message "Unknown schema version: $($importData.Version)" -ModuleName MyModule -FunctionName 'Schema: MySchemaName' -EnableException $EnableException -Cmdlet $Cmdlet
            return
        }
    }
    #endregion Process Data

    #region Handle resolved configuration entries
    foreach ($configItem in $configurationItems) {
        if ($ExcludeFilter | Where-Object { $configItem.FullName -like $_ }) { continue }
        if ($IncludeFilter -and -not ($IncludeFilter | Where-Object { $configItem.FullName -like $_ })) { continue }
        
        if ($Peek)
        {
            $configItem
            continue
        }

        Set-PSFConfig -FullName $configItem.FullName -Value $configItem.Value -AllowDelete:$AllowDelete -PassThru:$PassThru
    }
    #endregion Handle resolved configuration entries
}
```

> Note: Both `Read-Resource` and `ConvertFrom-MyDataFormatV1` are fictional commands you would be expected to implement.

## Full example implementation

While all the previous examples should give a good start on your own configuration schema, a full end-to-end example often helps as well, so here is an example of a configuration schema reading plaintext files:

+ Each line processed individually, trimming any whitespace
+ Empty lines skipped
+ Lines that start with a `#` are ignored
+ All text until the first whitespace is considered the name, the rest the value

```powershell
Register-PSFConfigSchema -Name PlainText -Schema {
    param (
        [string]
        $Resource,

        [System.Collections.Hashtable]
        $Settings
    )

    #region Converting parameter settings
    $Peek = $Settings["Peek"]
    $AllowDelete = $Settings["AllowDelete"]
    $PassThru = $Settings["PassThru"]
    $ExcludeFilter = $Settings["ExcludeFilter"]
    $IncludeFilter = $Settings["IncludeFilter"]
    $EnableException = $Settings["EnableException"]
    $Cmdlet = $Settings["Cmdlet"]
    $CurrentPath = $Settings["Path"]
    #endregion Converting parameter settings

    #region Utility Functions
    function ConvertFrom-PlainTextV1 {
        [CmdletBinding()]
        param (
            [Parameter(ValueFromPipeline = $true)]
            [string[]]
            $Text
        )
        process {
            foreach ($line in $Text) {
                if (-not $line -or -not $line.Trim()) { continue }
                $effectiveLine = $line.Trim()
                if ($effectiveLine -like "#*") { continue }

                $name, $value = $line -split " ",2
                [PSCustomObject]@{
                    FullName = $name
                    Value = $value
                }
            }
        }
    }
    #endregion Utility Functions

    #region Process Data
    try { $text = Get-Content -Path $Resource -ErrorAction Stop }
    catch {
        Stop-PSFFunction -Message "Error reading configuration file $Resource" -ModuleName MyModule -FunctionName 'Schema: PlainText' -EnableException $EnableException -Cmdlet $Cmdlet -ErrorRecord $_
        return
    }
    $schemaVersion = 1
    if ($text -and $text[0] -match '^#version: \d+$') {
        $schemaVersion = ($text[0] -replace '^#version: (\d+)$','$1') -as [int]
    }

    $configurationItems = switch ($schemaVersion) {
        1 {
            $text | ConvertFrom-PlainTextV1
        }
        default {
            Stop-PSFFunction -Message "Unknown schema version: $($schemaVersion)" -ModuleName MyModule -FunctionName 'Schema: MySchemaName' -EnableException $EnableException -Cmdlet $Cmdlet
            return
        }
    }
    #endregion Process Data

    #region Handle resolved configuration entries
    foreach ($configItem in $configurationItems) {
        if ($ExcludeFilter | Where-Object { $configItem.FullName -like $_ }) { continue }
        if ($IncludeFilter -and -not ($IncludeFilter | Where-Object { $configItem.FullName -like $_ })) { continue }
        
        if ($Peek)
        {
            $configItem
            continue
        }

        Set-PSFConfig -FullName $configItem.FullName -Value $configItem.Value -AllowDelete:$AllowDelete -PassThru:$PassThru
    }
    #endregion Handle resolved configuration entries
}
```

> Note: This implementation works.
> But very little else - it has no consideration for data type and provides no convenient authoring shortcuts.
> It exists only as a POC - for a serious configuration schema, it is strongly recommended to use formats with better structuring and type fidelity capabilities, such as Json, XML or YAML.
> We also only process `$Resource` as a file path, while it might instead be a weblink or the actual text content.
> Supporting all three options for `$Resource` is not mandated, but strongly recommended.

[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)
