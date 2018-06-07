---
title: configuration: Scenario: CI/CD
---
# Scenario: CI/CD
## Synopsis

A strategic guide to implementing configuration in a CI/CD pipeline.

## Description

PowerShell in the CI/Cd pipeline introduces powershell to an environment fundamentally different from common administration scenarios.
Environments are less persistent, often with life-times measured in minutes.
Such a pipeline needs to pass through multiple stages with entirely different demands on the code.
This requires code that is flexible to configure, that can adapt to each scenario, lest maintenance costs soar.

At the same time, there is a need to have the configuration of the pipeline and the environments as part of the source code.

The PSFramework configuration system supports this scenario in several ways:

 - Persist configuration in a humanly readible way, to better track changes in source control.
 - Import from explicitly specified paths
 - Export to explicitly specified paths

These features a seamlessly compatible with the other configuration options for other use-cases.
This allows applying them to code not originally designed for CI/CD, so long as it uses PSFramework configuration for its own ends.

> In addition to this, many features in the PSFramework are controllable by the very same configuration system, allowing tuning its systems to your own needs.

## Implementation
### Phases of implementation

 - Using the configuration items in code
 - Defining the import of configuration files
 - Creating configuration files

### Using configuration items in code

In a short-lived, volatile environment, doing full up configuration [initialization](initialize.html) is a lot of effort for less return.
Configuration keeps being an iteration, right along with iterating over the rest of the code and it starts with the _need_ for a specific setting.
Thus one often starts with implementing the read action:

```powershell
Get-PSFConfigValue -FullName "MyProject.Build.Repository" -NotNull
```

This call will return the value stored in `"MyProject.Build.Repository"`.
If it hasn't been defined yet, it will fail in error (forcing you to remember to define the setting).

### Defining the import of configuration files

You can store any number of configuration files and load several of them as needed at runtime.
You will need to detect for yourself which configuration file to load in what situation.
Either way, each configuration item is natively valid as long as the process running it persists.

```powershell
# Importing a set of settings from file
Import-PSFConfig -File .\config-test.json
```

> When importing multiple files that change the same setting, the last one to be imported wins.

### Creating Configuration Files

With the setting used in our CI/CD code, the correct configuration file being imported in the correct environment ... well, now it is time to create that file to be imported.

The easiest way to create a configuration file is to create/apply the settings in a powershell console and exporting them to file.
This can be done like this:

```powershell
# Gather settings to export
$configToExport = @()
$configToExport += Set-PSFConfig -FullName "MyProject.Build.Repository" -Value "foo" -SimpleExport -PassThru
$configToExport += Set-PSFConfig -FullName "MyProject.Build.Artifactory" -Value "bar" -SimpleExport -PassThru
$configToExport += Set-PSFConfig -FullName "SomeModule.SomeSetting" -Value "1" -SimpleExport -PassThru
$configToExport += Set-PSFConfig -FullName "SomeModule.SomeSetting2" -Value 2 -SimpleExport -PassThru
$configToExport += Set-PSFConfig -FullName "SomeModule2.SomeSetting" -Value "3" -SimpleExport -PassThru
$configToExport += Set-PSFConfig -FullName "SomeModule2.SomeSetting2" -Value $true -SimpleExport -PassThru

# Write the configuration file
$configToExport | Export-PSFConfig -OutPath .\config-test.json
```

## Considerations and resources
### The -SimpleExport Parameter

There are two ways to export data to file:

 - With default serialization
 - With Json serialization

The technical details [are covered in a dedicated guide](persistence-serialization.html), but basically, Json is easier to manually inspect and edit.
This has some very real benefits when try to track or search changes in source control.
You enable this way of export, by using the `-SimpleExport` parameter.

Using it can lose you some functionality with very complex types, but so long as you only care about some simple properties on the object, that won't matter much.
The default way of doing it can be easier on primitive types (especially numbers, strings or boolean).

### Manually Editing the file

You can manually update an exported json file.
The system will ignore additional properties, so long as the resulting json is still valid.
This enables you to add comments, documentation or add properties for other consumers of the file.

### Persisting across processes

In some task sequences, individual sequences are run in their own process.
If you want to avoid having to apply configuration again explicitly on each run, you can instead use `Register-PSFConfig` to register these settings for automatic import.

```powershell
Register-PSFConfig -Module MyProject
```

This command is covered in greater detail in the [basics of persistence](persistence-basics.html) guide.

> Keep in mind that these settings persist as long as the machine exists if that is done. If you are using a one-time use agent, this is of no consequence.
> If your agent however is permanently available and does not reset itself, settings might affect subsequent workloads.

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-07 |
