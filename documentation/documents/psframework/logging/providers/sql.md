# Logging Provider: SQL

> [Back to: Logging](../../logging.html)

> What are [Logging Providers](../basics/logging-providers.html)?
>
> [Logging to NAME](../loggingto/sql.html)

## Description

The SQL Logging Provider enables you to write logs to a MS SQL Server database.
It will automatically create database or table if necessary (and able to).

## Stats

|Name|Sql|
|Version|2|
|ConfigurationRoot|PSFramework.Logging.Sql|
|Supports Data|False|
|Installation|Required|

## Installation

The Sql provider requires the [dbatools PowerShell Module](https://dbatools.io) installed on the system it is running on.

To install the prerequisites use either:

```powershell
Install-PSFLoggingProvider -Name Sql
```

Or manually deploy the required module.

## Properties

> Properties are used to control the behavior of the Provider.
> They can be specified using Set-PSFLoggingProvider or provided using the [Configuration system](../../configuration.html).

|Name|Default Value|Description|
|---|---|---|
|Database|LoggingDatabase|Name of the SQl Database to log to. Will be created if needed and able.|
|Table|LoggingTable|Name of the table in that database to write to. Will be created if needed and able.|
|SqlServer||The SQL Server to connect to.|
|Credential||The credentials to use for connecting to the SQL server.|

## Notes

### The Table

The logging provider offers to configure the table if needed.
However often enough, you don't want the actual script to have any more access than the ability to write log data.

If you want to provision the table yourself, this is the actual CREATE TABLE statement we use:

```SQL
CREATE TABLE $SqlTable (
    Message VARCHAR(max),
    Level VARCHAR(max),
    TimeStamp [DATETIME],
    FunctionName VARCHAR(max),
    ModuleName VARCHAR(max),
    Tags VARCHAR(max),
    Runspace VARCHAR(36),
    ComputerName VARCHAR(max),
    TargetObject VARCHAR(max),
    [File] VARCHAR(max),
    Line BIGINT,
    ErrorRecord VARCHAR(max),
    CallStack VARCHAR(max)
)
```

The column sizes are not validated, so if you want to do more conservative constraints, feel free.
These were picked for maximum compatibility.

The only permissions that the logging account needs is the ability to ascertain the table exists and to insert new values into it.

### Authentication

If you do not specify the `Credential` setting, the system will try to write using Windows Authentication as the current user.
With the `Credential` setting you can specify either SQL credentials or valid Windows credentials.

### The full might of the SqlServer Setting

Thanks to the dbatools' flexibility, you can offer a variety of different pieces of information to the `SqlServer` setting to control how the session is established.

In effect, this allows you to finetune any part of the connection, connecting to a cloud-hosted instance or one hosted in a Linux container.

Examples of what would be legal input:

+ Servername
+ Servername\instancename
+ Servername:port
+ A full connectionstring
+ *A connection object already connected*

That last aspect is where the fun begins:
Using [Connect-DbaInstance](https://docs.dbatools.io/#Connect-DbaInstance) you can pre-establish a session and configure it as you please.
Then you can simply pass that through to the logging provider and it will re-use that session.

> Note: Sessions cannot be used in parallel from multiple threads.
> The Logging Provider executes in the background and may be accessed whenever.
> DO _not_ use the same session in the main runspace, lest you create write conflicts, failing either your main code or your logging.

> [Back to: Logging](../../logging.html)
