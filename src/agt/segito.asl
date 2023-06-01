// Agent alice in project smarthome

/* Initial beliefs and rules */
veszelyvan(0).

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.").

+tuzvan(1)[source(veszelyErzekelo)] <- 
        .print("A haz kiuritese megkezdődött!");
        .wait(5000);
        .print("A haz kiuritese sikeres!");
        .send(biztonsagErzekelo,tell,uresahaz).
