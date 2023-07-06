CREATE TABLE utilisateur(
                            id SERIAL PRIMARY KEY NOT NULL,
                            email varchar(32) unique not null,
                            mdp varchar(32) not null,
                            role varchar(10) not null,
                            banni boolean not null
);

CREATE TABLE forum(
                      id SERIAL PRIMARY KEY NOT NULL,
                      titre varchar(32) UNIQUE NOT NULL,
                      descriptif text,
                      date_heure_creation timestamp NOT NULL,
                      actif boolean NOT NULL,
                      user_id INTEGER NOT NULL,
                      FOREIGN KEY (user_id) REFERENCES utilisateur(id)
);

CREATE TABLE sujet(
                      ID SERIAL PRIMARY KEY NOT NULL,
                      titre varchar(32) NOT NULL,
                      descriptif text,
                      date_heure_creation timestamp NOT NULL,
                      actif boolean NOT NULL,
                      user_id INTEGER NOT NULL,
                      forum_id INTEGER NOT NULL,
                      FOREIGN KEY (user_id) REFERENCES utilisateur(id),
                      FOREIGN KEY (forum_id) REFERENCES forum(id)
);

CREATE TABLE message(
                        titre varchar(32) NOT NULL,
                        descriptif text,
                        nombre_de_like INTEGER,
                        date_heure_creation timestamp NOT NULL,
                        actif boolean NOT NULL,
                        user_id INTEGER not null,
                        sujet_id INTEGER NOT NULL,
                        FOREIGN KEY (user_id) REFERENCES utilisateur(id),
                        FOREIGN KEY (sujet_id) REFERENCES sujet(id)
);