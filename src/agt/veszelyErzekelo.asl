// Agent bob in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.").

+tuz <- .send(biztonsagErzekelo,tell,tuz);
        .send(segito,tell,tuz);
        .print("Tuz van").

+oxigenhiany <- .send(biztonsagErzekelo,tell,oxigenhiany);
                .send(segito,tell,oxigenhiany);
                .print("Oxigenhiany van").