﻿---
title: PSFramework: The Logging System
---

# The Logging System

> The documentation is still a work in progress.
Some pages still contain but a placeholder, filling in the content as fast as I an make myself write it.

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

## Core Concepts

- [Summary: Architecture](logging/core/summary-architecture.html)
- [Core Concepts](logging/core/core-concepts.html)

## Quick Start Guides

- [Logging Quick Start Guide](https://psframework.org/documentation/quickstart/psframework/logging.html)

## Logging To ...

A quick refence list on how to log to the built-in Logging Providers:

- [... the debug log](logging/loggingto/debuglog.html)
- [... a logfile](logging/loggingto/logfile.html)
- [... the Windows Eventlog](logging/loggingto/eventlog.html)
- [... Azure Log Analytics](logging/loggingto/azureloganalytics.html)
- [... Splunk](logging/loggingto/splunk.html)
- [... Graylog](logging/loggingto/graylog.html)
- [... SQL](logging/loggingto/sql.html)
- [... Console](logging/loggingto/console.html)

## Basics

- [Writing Messages](logging/basics/writing-messages.html)
- [Troubleshooting](logging/basics/troubleshooting.html)
- [Logging Providers](logging/basics/logging-providers.html)
- [In-Memory debug log](logging/basics/inmemory-debuglog.html)
- [Message Levels](logging/basics/message-levels.html)
- [Multilingual Messages](logging/basics/multilingual.html)
- [Message Configuration Settings](logging/basics/message-configuration-settings.html)
- [Tuning the Message display style](logging/basics/message-display-style.html)

## Logging Providers

The full reference documentation for each built-in Logging Provider

- [The FileSystem Provider](logging/providers/filesystem.html)
- [The LogFile Provider](logging/providers/logfile.html)
- [The Eventlog Provider](logging/providers/eventlog.html)
- [The Azure Log Analytics Provider](logging/providers/azureloganalytics.html)
- [The GELF Provider](logging/providers/gelf.html)
- [The Splunk Provider](logging/providers/splunk.html)
- [The SQL Provider](logging/providers/sql.html)
- [The Console Provider](logging/providers/console.html)

## Conference Recordings

- [PowerShell Summit 2019: Logging in a DevOps world](https://www.youtube.com/watch?v=Uy5Qd9g25Dg)
- [PSConfAsia 2018: Logging in a DevOps world](https://livestream.com/gaelcolas/PSConfAsia/videos/182706619)

## Advanced

- [Writing Custom Logging Providers](logging/advanced/writing-logging-providers.html)
- [The Logging Sequence](logging/advanced/logging-sequence.html)
- [Debugging Logging Providers](logging/advanced/debugging-providers.html)
- [Message Policies](logging/advanced/message-policies.html)
- [Cmdlets & Logging](logging/advanced/cmdlets-and-logging.html)
- [Logging Provider Generations](logging/advanced/logging-provider-generations.html)
- [Filtering by Runspace](logging/advanced/filtering-by-runspace.html)

## Notes

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)
