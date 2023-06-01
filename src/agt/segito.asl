// Agent alice in project smarthome

/* Initial beliefs and rules */
veszelyvan(0).

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.").
