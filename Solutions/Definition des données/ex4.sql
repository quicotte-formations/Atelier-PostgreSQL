CREATE TABLE auteur (
                        id SERIAL,
                        nom VARCHAR (30),
                        prenom VARCHAR(30)
);
ALTER TABLE auteur ADD CONSTRAINT auteur_pk PRIMARY KEY (id);

CREATE TABLE editeur (
                         id SERIAL,
                         nom VARCHAR (30),
                         numero_telephone INT,
                         adresse VARCHAR(120),
                         email VARCHAR(80)
);
ALTER TABLE editeur ADD CONSTRAINT editeur_pk PRIMARY KEY (id);
ALTER TABLE editeur ADD CONSTRAINT email_ed_unique UNIQUE (email);

CREATE TABLE collection (
                            id SERIAL,
                            titre VARCHAR(80),
                            description TEXT
);
ALTER TABLE collection ADD CONSTRAINT collection_pk PRIMARY KEY (id);
ALTER TABLE collection ADD CONSTRAINT titre_unique UNIQUE (titre);

CREATE TABLE genre (
                       id SERIAL,
                       nom VARCHAR(70)
);
ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (id);
ALTER TABLE genre ALTER COLUMN nom SET NOT NULL;

CREATE TABLE livre (
                       id SERIAL,
                       titre VARCHAR(50),
                       date_publication DATE,
                       description TEXT,
                       prix FLOAT,
                       nombre_pages INT,
                       editeur_id INT,
                       collection_id INT
);
ALTER TABLE livre ADD CONSTRAINT livre_pk PRIMARY KEY (id);
ALTER TABLE livre ADD CONSTRAINT titre_livre_unique UNIQUE (titre);
ALTER TABLE livre ADD CONSTRAINT editeur_id_fk FOREIGN KEY (editeur_id) REFERENCES editeur(id);
ALTER TABLE livre ADD CONSTRAINT collection_id_fk FOREIGN KEY (collection_id) REFERENCES collection(id);

CREATE TABLE livre_genre (
                             livre_id INT,
                             genre_id INT
);
ALTER TABLE livre_genre ADD CONSTRAINT livre_id_fk FOREIGN KEY (livre_id) REFERENCES livre(id);
ALTER TABLE livre_genre ADD CONSTRAINT genre_id_fk FOREIGN KEY (genre_id) REFERENCES genre(id);

CREATE TABLE livre_auteur (
                              livre_id INT,
                              auteur_id INT
);
ALTER TABLE livre_auteur ADD CONSTRAINT livre_id_fk FOREIGN KEY (livre_id) REFERENCES livre(id);
ALTER TABLE livre_auteur ADD CONSTRAINT auteur_id_fk FOREIGN KEY (auteur_id) REFERENCES auteur(id);