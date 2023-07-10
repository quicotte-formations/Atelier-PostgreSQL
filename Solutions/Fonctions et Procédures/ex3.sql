CREATE OR REPLACE function film_aleatoire()
    RETURNS VARCHAR AS
$$
DECLARE
    titre_actuel VARCHAR;
    nb_films INTEGER;
    cur_titres CURSOR FOR
        SELECT  titre
        FROM    film;
    nb_aleat INTEGER;
    i INTEGER;
BEGIN

    -- Compte nb films
    nb_films := (SELECT COUNT(*) FROM film);

    -- Tire 1 nbre au hasard entre 0 et nbFilms
    nb_aleat := aleatoire(0,nb_films);
    OPEN cur_titres;

    FOR i IN 0..nb_aleat LOOP
            FETCH cur_titres INTO titre_actuel;
        END LOOP;

    CLOSE cur_titres;

    RETURN titre_actuel;
END;
$$
    LANGUAGE plpgsql;

SELECT film_aleatoire();