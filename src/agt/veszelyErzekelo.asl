// Agent bob in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("hello world.").

+tuz <- .send(biztonsagErzekelo,tell,tuzvan(1));
        .send(segito,tell,tuzvan(1));
        .print("Tuz van").

+oxigenhiany <- .send(biztonsagErzekelo,tell,oxigenhiany);
                .send(segito,tell,oxigenhianyvan);
                .print("Oxigenhiany van").