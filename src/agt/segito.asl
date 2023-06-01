// Agent alice in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+tuzvan(1)[source(veszelyErzekelo)] <- 
        .print("A haz kiuritese megkezdődött!");
        .wait(5000);
        .print("A haz kiuritese sikeres!");
        .send(biztonsagErzekelo,tell,uresahaz).

+tuzoltok <- .print("Megjöttek a tűzoltók");
                .send(biztonsagErzekelo,tell,ajtonyitas);
                .send(veszelyErzekelo,tell,holatuz);
                .send(self,tell,tuzoltokKiserese).

+tuzoltokKiserese <- .wait(3000);
                        .print("A tűzoltók a tűzhöz lettek kísérve");
                        .wait(5000);
                        .print("A tűz oltása befejeződött");
                        .wait(1000);
                        .print("A tűzoltók kikísérve a házból");
                        .send(veszelyErzekelo,tell,elmultAVeszely).
