# Example: A simple workflow

[Back to Runspace Workflows](../runspace-workflows.html)

## Description

On a fundamental level, to get this system to work, we need to take the following steps:

+ Create a Runspace Workflow
+ Add a worker for each step
+ Add the original input
+ Start the Workflow
+ Wait until it is completed
+ Receive results and end

```powershell
$workflow = New-PSFRunspaceWorkflow -Name 'ExampleWorkflow
```

[Back to Runspace Workflows](../runspace-workflows.html)