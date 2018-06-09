---
title: configuration: Scenario: Script
---
# Scenario: Script
## Synopsis

A guide to implementing configuration in scripts.

## Description

As an administrator, you often deal with individual script files.
For example, when dealing with scheduled tasks or when deploying logon scripts via group policy.

These too can benefit from configuration.

This however is often less easy, as it requires keeping an index of what settings were created (With the PSFramework configuration system, [modules](scenario-module.html) can advertise their settings, making this mostly a moot point for them).

### Design Considerations

Generally, script files too should be maintained in a source control system (so you have one source of truth for scripts).
With a central location to search, either files can be read or scripts can be parsed.

This makes it possible to ensure, that the same setting has the same name across all scripts and avoid duplication.

Now what should you be configuring for scripts?
Generally, environment specific settings that may be subject to infrequent change.
For example:

 - Mail Server to use
 - Root OU in Active Directory where users should be in
 - Path to the data share

Often, settings that are specific to a given script should be implemented as parameters, as configuring them by policy is usually no better than updating the line calling the script.

Basically, configuration can be used to avoid hard-coding environment specific resources, paths, addresses.

### Implementation

A [declaration or initialization](initialize.html) or much of the other fancy, complex options are usually not needed when managing scripts via configuration.

Often, it comes down to something as simple as this:

```powershell
[CmdletBinding()]
param (
	$MaxDays = 7,
	
	$SmtpServer = (Get-PSFConfigValue -FullName Company.Smtp.Server -Fallback "mail1.company.domain")
)

# rest of script
# ...
```

In this example we set the variable `$SmtpServer` to `"mail1.company.domain"` unless an explicit parameter is specified or the configuration setting `Company.Smtp.Server` is deployed by policy.

This makes it not necessary to mess with policy unless the value changes, but allows updating all scripts to use a new server without having to go back and manually update them right away.

### Additional resources

This scenario doesn't really need any further resources to function.
In order to read up on managing by policy however, see the [locations](persistence-location.html) guide, to see which registry paths to use.
You can then use `Register-PSFConfig` to store a value in registry locally, read how it was written and apply the same setting via GPO or DSC or SCCM or any other management system of your choice.

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-05-23 |
