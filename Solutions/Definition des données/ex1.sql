CREATE TABLE client (
                        id SERIAL NOT NULL,
                        pseudo VARCHAR(32) NOT NULL,
                        mdp VARCHAR(32) NOT NULL
);
ALTER TABLE client ADD CONSTRAINT id_pk PRIMARY KEY (id);
ALTER TABLE client ADD CONSTRAINT pseudo_unique UNIQUE (pseudo);

CREATE TABLE commande (
                          id SERIAL NOT NULL,
                          date_heure_creation TIMESTAMP NOT NULL,
                          prix_total FLOAT NOT NULL,
                          etat VARCHAR(10) NOT NULL,
                          client_id INT NOT NULL
);
ALTER TABLE commande ADD CONSTRAINT id_pk2 PRIMARY KEY (id);
ALTER TABLE commande ADD CONSTRAINT client_id_fk FOREIGN KEY (client_id) REFERENCES client(id);

CREATE TABLE commande_produit (
                                  id SERIAL NOT NULL,
                                  commande_id INT NOT NULL,
                                  produit_id INT NOT NULL
);
ALTER TABLE commande_produit ADD CONSTRAINT id_pk3 PRIMARY KEY (id);
ALTER TABLE commande_produit ADD CONSTRAINT commande_id_fk FOREIGN KEY (commande_id) REFERENCES commande(id);

CREATE TABLE categorie (
                           id SERIAL NOT NULL,
                           nom VARCHAR(32) NOT NULL
);
ALTER TABLE categorie ADD CONSTRAINT id_pk4 PRIMARY KEY (id);
ALTER TABLE categorie ADD CONSTRAINT nom_unique UNIQUE (nom);

CREATE TABLE produit (
                         id SERIAL NOT NULL,
                         nom VARCHAR(32) NOT NULL,
                         prix SERIAL NOT NULL,
                         categorie_id INTEGER NOT NULL
);
ALTER TABLE produit ADD CONSTRAINT id_pk5 PRIMARY KEY (id);