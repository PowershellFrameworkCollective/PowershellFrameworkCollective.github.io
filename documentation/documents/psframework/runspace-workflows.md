---
title: PSFramework: Runspace Workflows
---

# Runspace Workflows

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)

## Synopsis

Runspace Workflows allow easily architecting a set of steps that will be execute in parallel:

+ For Each step of a workflow, define how many times it should be executed in parallel
+ The results of one step become the input for the next step
+ No need to deal with the details - just provide the business logic for each step

## Description

The fundamental system of Runspace Workflow consists of three main components:
The Workflow Object, the Worker and the Queue:

+ Workflow Object: Represents the entire workflow and hosts all the interna, including the Workers and the Queues.
+ Worker: An individual step in the workflow, the worker contains the business logic of that step, the configuration and the runspaces actually executing it.
+ Queue: A workflow can have as many queues as desired. They ensure data gets exchanged between steps, usually the output of one step becoming the input of the next step.

## Core Concepts

+ [The Workflow Object](runspace-workflows/workflow.html)
+ [The Worker](runspace-workflows/worker.html)
+ [The Queue](runspace-workflows/queue.html)

## Examples

While the details on the components may provide value, this system benefits most from some examples:

+ [A simple workflow](runspace-workflows/examples-simple.html)
+ [Including Variables, Functions and Modules](runspace-workflows/examples-resources.html)
+ [Different variable value per runspace](runspace-workflows/examples-perrunspacevariables.html)
+ [Automatically ending Workflows](runspace-workflows/examples-auto-close.html)
+ [When the first step generates the input](runspace-workflows/examples-first-step-data.html)
+ [Branching Flows - One step feeding multiple others](runspace-workflows/examples-multi-pronged-flows.html)
+ [Data outside of the Queues](runspace-workflows/examples-the-data-field.html)

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)
