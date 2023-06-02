// Agent alice in project smarthome

/* Initial beliefs and rules */

/* Initial goals */
!azonositas.

/* Plans */

+tuzvan(1)[source(veszelyErzekelo)] 
    <- .print("A ház kinyitása megkezdődik.");
        .send(biztonsagErzekelo,tell,ajtonyitas).

+uresahaz[source(segito)] <-.print("A ház lezárása elkezdődött.");
                            .send(self,tell,ajtocsukas).

+!azonositas : azonositasTrue <- .wait(3000);
                    .print("azonositas sikeres");
                    .send(biztonsagErzekelo,tell,ajtonyitas);
                    .wait(3000);
                    .send(biztonsagErzekelo,tell,ajtocsukas);
                    -azonositasTrue[source(percept)];
                    !azonositas.

+!azonositas : azonositasFalse <- .wait(3000);
                    .print("azonositas sikertelen");
                    -azonositasFalse[source(percept)];
                    !azonositas.

+!azonositas : not azonositasTrue & not azonositasFalse <- !azonositas.

+ajtonyitas <- .print("ajto kinyilt").
                 
+ajtocsukas <- .print("ajto becsukodott").