CREATE TABLE style (
                       id SERIAL PRIMARY KEY,
                       nom VARCHAR(32)
);

CREATE TABLE artiste (
                         id SERIAL PRIMARY KEY,
                         nom VARCHAR(32)
);

CREATE TABLE concert (
                         id SERIAL PRIMARY KEY,
                         nom VARCHAR(32),
                         lieu VARCHAR(32),
                         date_concert DATE
);

CREATE TABLE ticket (
                        id SERIAL PRIMARY KEY,
                        concert_id INT, --ini des FK
                        concert_date DATE,
                        FOREIGN KEY (concert_id) REFERENCES concert(id)
);

CREATE TABLE client (
                        id SERIAL PRIMARY KEY,
                        nom VARCHAR(32),
                        prenom VARCHAR(32)
);

CREATE TABLE commande (
                          id SERIAL PRIMARY KEY,
                          client_id INT, --ini des FK
                          date_commande DATE,
                          FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE style_artiste (
                               style_id INT, --ini des FK
                               artiste_id INT, --ini des FK
                               FOREIGN KEY (style_id) REFERENCES style(id),
                               FOREIGN KEY (artiste_id) REFERENCES artiste(id)
);

CREATE TABLE commande_ticket (
                                 commande_id INT, --ini des FK
                                 ticket_id INT, --ini des FK
                                 FOREIGN KEY (commande_id) REFERENCES commande(id),
                                 FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE concert_ticket (
                                concert_id INT,
                                ticket_id INT,
                                FOREIGN KEY  (concert_id) REFERENCES  concert(id),
                                FOREIGN KEY (ticket_id) REFERENCES  ticket(id)
);
