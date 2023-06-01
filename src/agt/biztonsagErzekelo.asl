// Agent alice in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.").

+azonositasTrue <- .send(biztonsagErzekelo,tell,ajtonyitas);
                    .print("azonositas sikeres").

+azonositasFalse <- .print("azonositas sikertelen").

+ajtonyitas <- .print("ajto kinyilt");
                .wait(3000);
                .send(biztonsagErzekelo,tell,ajtocsukas).
                

+ajtocsukas <- .print("ajto becsukodott").