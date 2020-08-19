---
title: PSFramework: The Logging System
---

# The Logging System

> The documentation of this component refers to v1.3.135, which is as of this writing still in prerelease/preview.
> Some of this documentation may point at content not yet published to the gallery at all.
> Some aspects may yet be subject to change.

## Synopsis

The logging system enables maximum flexibility when logging for minimal complexity to use.
It supports logging in different formats to a variety of logging services.
Its asynchronous nature prevents impact on code performance while being runspace-safe to use.

## Key Features / Benefits

- Log to file, eventlog, Azure Log Analytics, Splunk, Graylog or SQL with out-of-the-box-tools
- Simple to use: Get started in less than 5 minutes
- Extensible with custom logging logic
- Configurable logging at script, process, user or machine level
- Enable scripts to integrate into existing logging, without code-change
- Runspace-Safe: Logging from multiple runspaces in parallel without conflict
- Rich log data for both debugging and auditing
- Automatic debug log

## Description

The PSFramework logging system is the most powerful logging solution in the PowerShell ecosystem.
At its core concept, it separates the usual logging process into two individual segments:

- Message
- Logging

On one end, scripts use `Write-PSFMessage` and related commands to generate messages.
To these, policies and transformations may be applied if registered by code or user.
The final result is queued for logging.

Then the logging parts come into play.
The logging is configured either per configuration or using `Set-PSFLoggingProvider`.
Each logging plugin - "Logging Provider" - can be configured separately and active in parallel.
The resolved message gets processed by each active provider and is thus written.

> The details are a bit more evolved - see the "advanced" section - but those are of interest only to those writing their own Logging Providers.

## Quick Start Guides

- [Logging Quick Start Guide](https://psframework.org/documentation/quickstart/psframework/logging.html)

## Logging To ...

A quick refence list on how to log to the built-in Logging Providers:

- [... the debug log](logging/loggingto/debuglog.html)
- ... a logfile
- ... the Windows Eventlog
- ... Azure Log Analytics
- ... Splunk
- ... Graylog
- ... SQL

## Basics

> Structure & Content Pending

## Logging Providers

The full reference documentation for each built-in Logging Provider

- The FileSystem Provider
- The LogFile Provider
- The Eventlog Provider
- The Azure Log Analytics Provider
- The GELF Provider
- The Splunk Provider
- The SQL Provider

## Conference Recordings

- [PSConfAsia 2018: Logging in a DevOps world](https://livestream.com/gaelcolas/PSConfAsia/videos/182706619)
- [PowerShell Summit 2019: Logging in a DevOps world](https://www.youtube.com/watch?v=Uy5Qd9g25Dg)

## Advanced

> Structure & Content Pending

## Notes

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)
