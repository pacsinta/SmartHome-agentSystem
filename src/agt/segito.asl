// Agent alice in project smarthome

/* Initial beliefs and rules */
szoba(1).

/* Initial goals */

+tuzvan(1)[source(veszelyErzekelo)] 
    <- .print("OK").

+dirt 
    <- .print("Takarít.").
