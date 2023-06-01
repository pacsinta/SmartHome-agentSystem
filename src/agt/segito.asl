// Agent alice in project smarthome

/* Initial beliefs and rules */
szoba(1).
!checkdirt.

+!checkdirt : not tuzvan(1)[source(veszelyErzekelo)]
    <- .wait(1000);
       if (math.random(1) > 0.7) {
        !clean;
       }else {
        !checkdirt;
       }.

+!checkdirt : tuzvan(1)[source(veszelyErzekelo)]
    <- .wait(1000);
       !checkdirt.

+!clean <- .print("Clean!"); !checkdirt.


+tuzvan(1)[source(veszelyErzekelo)] <- 
        .print("A haz kiuritese megkezdődött!");
        .wait(5000);
        .print("A haz kiuritese sikeres!");
        .send(biztonsagErzekelo,tell,uresahaz).
