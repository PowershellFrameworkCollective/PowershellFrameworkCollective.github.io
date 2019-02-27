---
title: PSFramework: The Configuration System
---
# The Configuration System
## Synopsis

The configuration system allows implementing configuration settings, similar to an options menu.

## Key Features / Benefits

 - Offer self-documented, validated options to user
 - Make modules manageable by Group Policy or DSC
 - Control scripts with configuration files
 - Provide a persisting cache
 - Eliminate options-commands
 - Allow control over internal settings, without having to pass them out as parameters.

## Description

The configuration system is a system that maintains settings for modules.
It has four common use scenarios:

### Module Options

A module can offer its settings in the configuration system, making them discoverable and self-documented.
This basically mimicks an options menu from regular applications.
It allows offering sane default values but still giving the user a voice in how something is being executed, without having to drive complexity by passing through dozens of parameters.

Users can then either change these settings per session or more permanently.

In Windows environments, it then becomes simple to apply settings by group policy.
This incidentaly makes it possible to update settings at scale without having to update the module, saving a lot of hassle on company internal modules when the environment changes.

### Script Control

Controlling scripts through configuration at scale allows ensuring compliance in these scripts.
This is generally used for non-specific settings that apply across most scripts of the entire estate, such as name of the mail server to use or where to log to.

### CI / CD Pipeline

Across a CI/CD Pipeline we have the same code pass through multiple stages and environments, requiring multiple settings.
The exportable/importable nature of the configuration system allows you to maintain environment specific settings as part of your code (and thus source control).

### Persisted Cache

The configuration system can also be used as a data cache that persists across sessions.

## Quick Start Guides

 - [Configuration Quick Start Guide](https://psframework.org/documentation/quickstart/psframework/configuration.html)

## In Depth Guides
### Core

 - [Configuration Basics](configuration/basics.html)
 - [Implementing Validation](configuration/validation.html)
 - [Using Handler Events](configuration/handler.html)
 - [In Hiding](configuration/in-hiding.html)
 - [The mysterious Initialize](configuration/initialize.html)
 - [Configuration Persistence Basics](configuration/persistence-basics.html)

### Scenario Guides

 - [Scenario Guide: Cache](configuration/scenario-cache.html)
 - [Scenario Guide: CI/CD](configuration/scenario-ci-cd.html)
 - [Scenario Guide: Module](configuration/scenario-module.html)
 - [Scenario Guide: Script](configuration/scenario-script.html)

### Persistence

 - [The Automatic Import Sequence](configuration/import.html)
 - [Where configuration is stored](configuration/persistence-location.html)
 - [Manually importing & exporting Configuration](configuration/persistence-manual-export-import.html)
 - [Persisted Module Cache](configuration/persistence-module-cache.html)
 - [Purging persisted data](configuration/persistence-purge.html)
 - [Persistence and Serialization](configuration/persistence-serialization.html)

### Other

 - [Deleting Settings](configuration/deleting-settings.html)

## Notes
[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-05-23 |
