// Agent bob in project smarthome

/* Initial beliefs and rules */

/* Initial goals */

+tuz <- .print("Tuz van");
        .send(biztonsagErzekelo,tell,tuzvan(1));
        .send(segito,tell,tuzvan(1));
        .send(self,tell,hatosagokErtesitese).

+oxigenhiany <- .send(biztonsagErzekelo,tell,oxigenhiany);
                .send(segito,tell,oxigenhianyvan);
                .print("Oxigenhiany van").

+hatosagokErtesitese <- .print("Hatóságok értesítésének megkezdése!");
                        .wait(1000);
                        .send(self,tell,tuzoltosagHivasa);
                        .wait(1000);
                        .send(self,tell,rendorsegHivasa);
                        .wait(1000);
                        .send(self,tell,mentokHivasa).

+tuzoltosagHivasa <- .print("Értesítettem a tűzoltóságot!");
                        .wait(10000);
                        .send(segito,tell,tuzoltok).
+rendorsegHivasa <- .print("Értesítettem a rendőrséget!").
+mentokHivasa <- .print("Értesítettem a mentőket!").

+holatuz <- .print("Átküldtem a koordinátákat").

+elmultAVeszely <- .print("Elmúlt a veszély, a család visszatérhet a házba!").