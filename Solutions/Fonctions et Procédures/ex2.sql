CREATE OR REPLACE FUNCTION aleatoire(mini INTEGER, maxi INTEGER)
    RETURNS integer as
$$
DECLARE
    nombre_aleatoire integer;
BEGIN
    nombre_aleatoire := floor(random() * (maxi-mini + 1)+ mini);
    RETURN nombre_aleatoire;
END;
$$
    LANGUAGE plpgsql;
SELECT aleatoire(1,10);