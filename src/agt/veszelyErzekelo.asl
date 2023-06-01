// Agent bob in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

+tuz <- .print("Tuz van");
        .send(biztonsagErzekelo,tell,tuzvan(1));
        .send(segito,tell,tuzvan(1)).
        

+oxigenhiany <- .send(biztonsagErzekelo,tell,oxigenhiany);
                .send(segito,tell,oxigenhianyvan);
                .print("Oxigenhiany van").