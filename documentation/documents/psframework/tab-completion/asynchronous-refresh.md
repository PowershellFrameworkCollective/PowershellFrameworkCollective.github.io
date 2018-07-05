---
title: Tab Completion: Asynchronous Refresh
---
# Asynchronous Refresh
## Synopsis

Shows how to implement Tab Completion with values that are refreshed in the background.

## Description

When providing values for tab completion, one of the frequent issues is that retrieving he values can take a lot of time.
Too much for the average user to tolerate (how much fun is a 5 seconds freeze after hitting Tab, huh?).

One option to deal with this is to load the data once and cache it.
That is better, but now the data will grow stale.
Now if it is not too critical that the data in question be up-to-date, that may be acceptable to you, however it would be more elegant if you could do refreshes of the data in the background, so the user doesn't notice.

Fortunately, the `PSFramework` module has a solution for this that makes it fast to implement:

 - Register a Task Engine task to run at a specified interval to do the refresh
 - Store the data using the Task Engine Cache
 - Provide the data from the cache during Tab Completion

### Defining the Refresh

```powershell
Register-PSFTaskEngineTask -Name ComputerCacheRefresh -Interval (New-TimeSpan -Minutes 5) -ScriptBlock {
    Set-PSFTaskEngineCache -Module MyModule -Name Computers -Value (Get-ADComputer -Filter *).Name
}
```

This example will execute every 5 minutes, storing the results of `(Get-ADComputer -Filter *).Name` in the cache under the module `MyModule` and name `Computers`.

### Defining Tab Completion

```powershell
Register-PSFTeppScriptblock -Name ADComputer -ScriptBlock {
    Get-PSFTaskEngineCache -Module MyModule -Name Computers
}
Register-PSFTeppArgumentCompleter -Command Get-Something -Parameter ComputerName -Name ADComputer
```

As was covered in the [Tab Completion guide](basics.html), you need to define a scriptblock and then assign it to command and parameter that should use it.
Using `Get-PSFTaskEngineCache -Module MyModule -Name Computers` during the Tab Completion scriptblock retrieves the information stored in the cache.

## Notes
[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2018-07-06 |
| Updated on: | 2018-07-06 |