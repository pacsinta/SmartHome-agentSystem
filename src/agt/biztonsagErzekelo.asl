// Agent alice in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.").

+tuzvan(1)[source(veszelyErzekelo)] 
    <- .print("A ház kinyitása megkezdődik.");
        .send(biztonsagErzekelo,tell,ajtonyitas).

+uresahaz[source(segito)] <-.print("A ház lezárása elkezdődött.");
                            .send(self,tell,ajtocsukas).

+azonositasTrue <- .wait(3000);
                    .print("azonositas sikeres");
                    .send(biztonsagErzekelo,tell,ajtonyitas);
                    .wait(3000);
                    .send(biztonsagErzekelo,tell,ajtocsukas).

+azonositasFalse <- .wait(3000);
                    .print("azonositas sikertelen").

+ajtonyitas <- .print("ajto kinyilt").
                 
+ajtocsukas <- .print("ajto becsukodott").