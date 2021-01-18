The PowerShell Framework project strives to provide tools and infrastructure for PowerShell developers.
Main Goals:

- Reduce development time needed
- Improve Manageability of developed code
- Enhance scalability of code
- Enhance uniformity of user experience


# The project's modules

## PSFramework

```powershell
Install-Module PSFramework
```

The PSFramework module is designed as a large toolkit, enabling simple integration of advanced features, manageability of code & scripts, as well as enhancements to the individual user's experience.

Prominent features:

- Advanced message & logging functionality
- Manage scripts & modules using DSC
- Simple Tab Completion
- Runspace-safe development
- PowerShell Scheduled tasks

## PSModuleDevelopment

```powershell
Install-Module PSModuleDevelopment
```

The PSModuleDevelopment module provides tools for the developer, for interactive use or as part of build actions.

Prominent features:

- Speed up test cycles
- Speed up debugging
- Refactoring tools
- Assembly/Typesystem tools
- Multilingual Help testing

## PSUtil

```powershell
Install-Module PSUtil
```

The PSUtil module is designed for improving the efficiency of _anybody_ using an interactive console. It includes useful utilities, helpers and other gadgets that make everyday console use just that little bit faster and more convenient.

Prominent features:

- Keybindings for frequently needed functionalities
- Simple directory navigation to often needed folders
- String manipulation on the pipeline (`trim`\|`replace`\|`split`\|`join`\|`format`\|...)
- Short aliases for commonly used commands (`grep` --> `Select-String`)
- Lots of other utilities ...

## MailDaemon

```powershell
Install-Module MailDaemon
```

Sending Emails is a fairly common task. Send a status report, send an alert, send a ... whatever, really.
Many scenarios, many emails and most platforms, services and - especially - people can handle mail.
But what starts with a simple `Send-MailMessage` can have some rather nasty consequences.
Configuring email settings in each script means system changes need to be rolled out to each script.
Scripts are transitive, short-lived.
A simple, short mail service outage can easily result in a critical mail going unsent!

Enter MailDaemon, the module to reliably handle all your email needs.

Prominent Features:

- Never lose an email to service interruption again
- Centrally manage your mail settings using the Group Policy, SCCM or another management platform of your choice.
- Authenticated SMTP without having to handle credentials in the individual tasks sending emails
