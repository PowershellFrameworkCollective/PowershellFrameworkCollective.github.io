---
title: configuration: Schema: MetaJson
---

# Schema: MetaJson

[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

## Synopsis

The MetaJson configuration schema is a json-based format designed for a human being to author configuration files in.
It provides the ability to dynamically evaluate settings, decide based on extensible filter conditions which settings to include or to chain an entire hierarchy of configuration files to merge into one setting.

## Description

This configuration schema has been optimized for human authoring.
As such, it fully relies on Json serialization when reading data values for most parts.

### Basic Layout

In its json structure, the overall layout is simple enough:

```json
{
    "Version": 1,
    "ModuleName": "",
    "<category1>": {

    },
    "<category2>": {

    }
}
```

> Version

The `Version` is used to identify, which version of the schema it was authored for.
If at a later time, PSFramework decides to change the way it parses configuration files with the MetaJson schema, it will determine based off this property on whether to still use the legacy processing for compatibility reasons.
This enables us to avoid breaking the config when updating the PSFramework.

The current latest version is `1`.

> ModuleName

The module name entry is used by the categories `Static`, `Object` and `Dynamic`.
It is used as a prefix to each configuration setting name.
It is optional and if omitted, all settings must include their full name, rather than the name without the module bit.

> Categories

There are a total of six different categories / node types you can specify.
Each category is a different way of providing one or more name/value pairs for the configuration.

You can use them in any combination, all of them optional (but if no category is specified, no setting is imported).
Some categories are intentionally unflexible but precise, while others are highly dynamic and allow for flexible values and complex decision-making, so use whichever fits best for you.

Each category is later described in full detail with example configuration in later chapters, but as a summary:

|Static|A static mapping of configuration names and values, values read straight from/as json|
|Object|A static mapping of configuration names and values, but each value is provided as a compressed Clixml string|
|Dynamic|A flat mapping of configuration names and values, using json serialization, but both subject to insertion from environment variables|
|Tree|Names provided through nested namespaces, supports conditionally including/excluding parts of its settings. Uses Json Serialization and neither name nor value are further interpreted|
|DynamicTree|Names provided through nested namespaces, supports conditionally including/excluding parts of its settings. Uses Json Serialization and name nor value are further interpreted via environment variables|
|Include|An additional array of files to also process as configuration files|

### Category: Static

Static is about the easiest way to provide configuration data under the metajson schema.
You provide a static list of name/value pairs and that is it.

> Example 1: Plain

```json
{
    "Version": 1,
    "Static": {
        "Bartender.Fridge.Size": 200,
        "Bartender.Fridge.Content": 180,
        "Bartender.Fridge.Manufacturer": "Siemens"
    }
}
```

> Example 2: ModuleName

```json
{
    "Version": 1,
    "ModuleName": "Bartender",
    "Static": {
        "Fridge.Size": 200,
        "Fridge.Content": 180,
        "Fridge.Manufacturer": "Siemens",
        "Cellar.Barrels": 42
    }
}
```

### Category: Object

Fundamentally, this works the same way the static category does.
The only difference is the way in which values are provided.

This may seem intimidating, but it allows for complex PowerShell objects to be provided without losing their integrity.
To generate the string data use `ConvertTo-PSFClixml`, e.g.:

```powershell
Get-Item C:\Windows | ConvertTo-PSFClixml
```

> Example 1: "Plain"

```json
{
    "Version": 1,
    "Object": {
        "Bartender.Fridge.Size": "H4sIAAAAAAAACm2O3wqCMBTG74PeYewBdqZ5FXPQpRAGKd1EF7YmGs7JNijfvmMiBXV1Pn7fH444XO+enLTzre1TGrGIcRZR8jRd71PahDBsAbxqtKk8M61y1ts6MGUNDPaBvUZ3HcScJ8ATKtcrQgRukqOus1tK+YwQlvkPm6gsRh+0YdjRKpwvAso/7s65avxvzcWPhypf5L74amSbWOKfAiaxZJeEANxB9b5evgBTCBTYFwEAAA==",
        "Bartender.Fridge.Content": "H4sIAAAAAAAACm2M0QqCMBSG74PeYewBdjbzImIOuhTCIKWb6MLWRMM52Qbl2zcTKcir8/H//3f48fZw6Kysa0yXYEYYoYRh9NJt5xJce9/vAJyslS4d0Y20xpnKE2k09OYZvFq1LUSUxkBjLNYrhHj4iU6qSu8JplMUwiL7y8ZU5IPzSpPgKOkvVw7FQru3thyWq0n8doGyGQ/5j5FuIsG2lMMI83ZecAh/An2uE29Q73PrFwEAAA==",
        "Bartender.Fridge.Manufacturer": "H4sIAAAAAAAACm2MQQrCMBBF94J3CDlAJpWuJA24FKSCKW7ERY0prTRNyQS0tzdaqoJdzef9/0bsLzckR+OxcV1GE5YwzhJKHrbtMKN1CP0aAHVtbInMNto7dFVg2lno3T16tWlbWHGeAk+pXC4IEfEnOZhqe80oH1GERf7HXlSqAYOxLDpGh9NZQDHTbrwvh/lqFL9dTPkUd+rHUFI1xpoOBajPdloIiH9iel+UTzoDi/UXAQAA"
    }
}
```

> Example 2: ModuleName

```json
{
    "Version": 1,
    "ModuleName": "Bartender",
    "Object": {
        "Fridge.Size": "H4sIAAAAAAAACm2O3wqCMBTG74PeYewBdqZ5FXPQpRAGKd1EF7YmGs7JNijfvmMiBXV1Pn7fH444XO+enLTzre1TGrGIcRZR8jRd71PahDBsAbxqtKk8M61y1ts6MGUNDPaBvUZ3HcScJ8ATKtcrQgRukqOus1tK+YwQlvkPm6gsRh+0YdjRKpwvAso/7s65avxvzcWPhypf5L74amSbWOKfAiaxZJeEANxB9b5evgBTCBTYFwEAAA==",
        "Fridge.Content": "3f48fZw6Kysa0yXYEYYoYRh9NJt5xJce9/vAJyslS4d0Y20xpnKE2k09OYZvFq1LUSUxkBjLNYrhHj4iU6qSu8JplMUwiL7y8ZU5IPzSpPgKOkvVw7FQru3thyWq0n8doGyGQ/5j5FuIsG2lMMI83ZecAh/An2uE29Q73PrFwEAAA==",
        "Fridge.Manufacturer": "H4sIAAAAAAAACm2MQQrCMBBF94J3CDlAJpWuJA24FKSCKW7ERY0prTRNyQS0tzdaqoJdzef9/0bsLzckR+OxcV1GE5YwzhJKHrbtMKN1CP0aAHVtbInMNto7dFVg2lno3T16tWlbWHGeAk+pXC4IEfEnOZhqe80oH1GERf7HXlSqAYOxLDpGh9NZQDHTbrwvh/lqFL9dTPkUd+rHUFI1xpoOBajPdloIiH9iel+UTzoDi/UXAQAA",
        "Cellar.Barrels": "H4sIAAAAAAAACm2M0QqCMBiF74PeYewB9k/zKuagSyEMUrqJLmxNNJyT/YPy7ZuJFNTVOZxzviMO1zuSk3bY2j6lEYsYZxElT9P1mNLG+2ELgKrRpkJmWuUs2tozZQ0M9hG4RncdxJwnwBMq1ytCRPgkR11nt5TyOQphmf9kUyqLEb02LDBa+fNFQPmn3TlXjf+rGfx0weWL3RdfRLaJZRILmHSZLgMB4Sa4t6J8AXAdfnsWAQAA"
    }
}
```

### Category: Dynamic

Dynamic is again similar to the Static category.
Key difference is that both name and values of the setting are subject to string replacement from environment variables.

> Example 1: Plain

```json
{
    "Version": 1,
    "Dynamic": {
        "Bartender.Fridge.Size": 200,
        "Bartender.Fridge.Content": 180,
        "Bartender.Fridge.Manufacturer": "%Manufacturer%"
    }
}
```

> Example 2: ModuleName

```json
{
    "Version": 1,
    "ModuleName": "Bartender",
    "Dynamic": {
        "Fridge.Size": 200,
        "Fridge.Content": 180,
        "Fridge.Manufacturer": "%Manufacturer%",
        "%Location%.Barrels": 42
    }
}
```

In these examples, we assume the existence of two environment variables: Manufacturer and Location.

### Category: Tree

With the three simple table categories out of the way, let's move to the fun and more convenient ones.
The tree category allows nesting the namespaces of configuration entries, making configuration sets easier to read and group.

As a downside, it can only contain simple json types, such as string, int or bool (with the previous three categories, it is possible to implement settings with values that are custom objects with arbitrary properties, or even full PowerShell objects).

> Example 1: Simple Tree

```json
{
    "Version": 1,
    "Tree": {
        "Bartender": {
            "Fridge": {
                "Size": 200,
                "Content": 180,
                "Manufacturer": "Siemens"
            },
            "Cellar.Barrels": 42
        }
    }
}
```

This configuration file will result in the same four configuration settings as seen before:

```text
Bartender.Fridge.Size         : 200
Bartender.Fridge.Content      : 180
Bartender.Fridge.Manufacturer : "Siemens"
Bartender.Cellar.Barrels      : 42
```

Much easier to read, and less effort to write.

> Example 2: Include Filter Conditionals

In addition to the previous tree structure, we can also make use of [Filter Expressions](../../filters.html)!
This allows us to selectively chose which part of the configuration to include:

```json
{
    "Version": 1,
    "Tree": {
        "Deployment": {
            "Mode": "Static"
        },
        "|AzureDevops": {
            "!Condition": "EnvAzDevPipeline -or -not OSWindows",
            "Deployment.Path": "/var/etc/whatever"
        },
        "|GithubActions": {
            "!Condition": "EnvGithubAction",
            "Deployment.Path": "/var/etc/whateverElse"
        },
        "|GitLab": {
            "!Condition": "EnvGitlab",
            "!ConditionSet": "ContosoCI ContosoEnv",
            "Deployment.Path": "/var/etc/lab"
        }
    }
}
```

In this example, we always define the setting

```text
Deployment.Mode : "Static"
```

However, the `Deployment.Path` setting is defined with different values, depending on which filter condition applies:

+ If powershell is running on Azure DevOps Pipelines or not on Windows, the value will be `"/var/etc/whatever"`.
+ If powershell is running on Github Actions, the value will be `"/var/etc/whateverElse"`.
+ If powershell is running on a Gitlab runner, the value will be `"/var/etc/lab"`.

By default, each [Filter Expression](../../filters.html) defined under `!Condition` is executed against the Environment Condition Set provided by the PSFramework.
If you want your expression to be evaluated using a different Condition Set, you also need to specify `!ConditionSet`, which consists of two parts:

+ The text until the first whitespace is the module name of the Condition Set
+ The text after the first whitespace is the name of the Condition Set itself

The Condition Set must be defined before using it during the Configuration Schema.

> Multiple valid conditions

If multiple conditions are valid, each valid node is executed.
If multiple conditional nodes define the same setting, the _last_ one wins.

> Conditional node names

In the example, the conditional nodes were named `|AzureDevOps`, `|GithubActions` and `|GitLab`.
These names are actually arbitrary and will never become part of the configuration settings name.
I.e. `Whatever`, `<AzureDevOps>`, `%1` or `Crud!` would have been equally valid.

### Category: DynamicTree

The DynamicTree category combines the nested namespacing (and filter condition) capabilities of the Tree mode with the name & value insertion of the Dynamic category.

> Example: Simple

```json
{
    "Version": 1,
    "Tree": {
        "Bartender": {
            "Fridge": {
                "Size": 200,
                "Content": 180,
                "Manufacturer": "%Manufacturer%"
            },
            "%Location%.Barrels": 42
        }
    }
}
```

Nothing more to cover here really, for details on the tree structure, see above for the Tree category description.

> Filter conditions & Dynamisms

The [Filter Expression](../../filters.html) statements defined in `!Condition` are _not_ subject to dynamic insertion from environment variables.

### Category: Include

In opposite to the other categories, the Include category does not directly define configuration settings.
With this setting you instead specify additional configuration files to load.

> Example 1: Simple includes

```json
{
    "Version": 1,
    "Static": {
        "Bartender.Fridge.Size": 200,
        "Bartender.Fridge.Content": 180,
        "Bartender.Fridge.Manufacturer": "Siemens"
    },
    "Include": [
        "C:\\config\\global.json",
        "furniture.json"
    ]
}
```

In this example - besides setting a few static settings - we first load the global.json file from its absolute path, then furniture.json from the same folder as the original input configuration file.

> Example 2: Dynamic Path Evaluation

```json
{
    "Version": 1,
    "Static": {
        "Bartender.Fridge.Size": 200,
        "Bartender.Fridge.Content": 180,
        "Bartender.Fridge.Manufacturer": "Siemens"
    },
    "Include": [
        "C:\\config\\global.json",
        "furniture.json",
        "%stage%/settings.json"
    ]
}
```

Same as in example 1, only this time we further add another configuration file from a subfolder relative to the original file.
The name of the subfolder is evaluated from environment variables, equal to how in the Dynamic category setting names and values were interpreted.

> Conflict Resolution

Any other categories are processed first, before executing the include files.
The include files are then processed in order from top to bottom.

Throughout that entire processing order, all settings are merged.
If more than one category or include files writes the same setting, the last one in the processing chain wins.

> Missing File

If one of the referenced files does not exist, it will generate a warning but processing continues.
To interrupt processing, call `Import-PSFConfig` with the `-EnableException` switch.

## Combining Categories

All categories can be freely combined, the last category to write a specific setting wins in case multiple categories try defining the same setting.

[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)
