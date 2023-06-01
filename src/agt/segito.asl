// Agent alice in project smarthome

/* Initial beliefs and rules */
szoba(1).

+dirt 
    <- .print("Takarít.").

+tuzvan(1)[source(veszelyErzekelo)] <- 
        .print("A haz kiuritese megkezdődött!");
        .wait(5000);
        .print("A haz kiuritese sikeres!");
        .send(biztonsagErzekelo,tell,uresahaz).

