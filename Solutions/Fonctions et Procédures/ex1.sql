CREATE OR REPLACE FUNCTION censure(texte VARCHAR)
    RETURNS VARCHAR AS
$$
DECLARE
    texte_censure VARCHAR;
BEGIN
    texte_censure := REPLACE(REPLACE(texte, 'guerre','amour'), 'combat', 'amour');
    RETURN texte_censure;
END;
$$
LANGUAGE plpgsql;

SELECT censure(titre) FROM film
WHERE titre LIKE '%guerre%' OR titre LIKE '%combat%';