# Summary: Architecture

> [Back to: Logging](../../logging.html)

Succinctly put:

+ You [generate messages](../basics/writing-messages.html) that you want logged.
+ After [applying policies](../advanced/message-policies.html) they get queued for logging.
+ A background runspace picks up those messages and starts writing
+ The actual log writing happens in [Logging Providers](../basics/logging-providers.html), plugins that implement logging to a specific service in a specific manner (e.g. to SQL, or logfile, or eventlog, or ...)
+ You can [write your own Logging Providers](../advanced/writing-logging-providers.html) if you care to.

> [Back to: Logging](../../logging.html)