-- 1
SELECT titre FROM film WHERE id = 24195;

-- 2
SELECT COUNT(*) as total_film
FROM film
WHERE annee=2022;

-- 3
SELECT MIN(annee), MAX(annee)
FROM film;

-- 4
SELECT count(film.id) AS nombre_film
FROM film
         JOIN real_film  ON film.id                 = real_film.film_id
         JOIN casting     ON real_film.casting_id = casting.id
WHERE casting.libelle='Woody Allen';

-- 5
SELECT COUNT(film.*)
FROM film
         JOIN acteur_film ON film.id =acteur_film.film_id
         JOIN casting ON acteur_film.casting_id=casting.id
WHERE casting.libelle='Eddie Murphy';

-- 6
SELECT film.*
from film
         join real_film on film.id=real_film.film_id
         join casting on real_film.casting_id=casting.id
         join film_genre on film.id=film_genre.film_id
         join genre on film_genre.genre_id=genre.id
         join film_pays on film.id = film_pays.film_id
         join pays on film_pays.pays_id = pays.id
where casting.libelle='Quentin Tarantino'
  and genre.nom='Policier'
  and pays.nom='États-Unis';

-- 7
SELECT COUNT (DISTINCT f.id)
FROM film f
         JOIN film_genre fg ON f.id = fg.film_id
         JOIN genre g ON g.id = fg.genre_id
         JOIN real_film rf ON f.id = rf.film_id
         JOIN casting c1 ON c1.id = rf.casting_id
         JOIN acteur_film af ON f.id = af.film_id
         JOIN casting c2 ON c2.id = af.casting_id
WHERE g.nom = 'Policier'
  AND c2.libelle='Steve Buscemi'
  AND c1.libelle LIKE '%Coen%';

-- 8
Select film
from film
         JOIN real_film on film.id=real_film.film_id
         JOIN casting as cast1 on real_film.casting_id=cast1.id
Where cast1.libelle = 'Sylvester Stallone'
Intersect
Select film
from film
         JOIN acteur_film on film.id=acteur_film.film_id
         JOIN casting as cast2 on acteur_film.casting_id=cast2.id
Where cast2.libelle = 'Sylvester Stallone';

-- 9
SELECT COUNT(*)
FROM (SELECT film.*
      FROM film
               join film_genre fg on film.id = fg.film_id
               join genre g on g.id = fg.genre_id
      where g.nom = 'Horreur-Epouvante'

      EXCEPT

      SELECT film.*
      FROM film
               join acteur_film af on film.id = af.film_id
               join casting c on c.id = af.casting_id
      where c.libelle = 'Bruce Campbell') films_horreur_pas_de_campbell;

-- 10
SELECT film.titre
FROM film
         JOIN acteur_film ON film.id = acteur_film.film_id
         JOIN casting ON acteur_film.casting_id = casting.id
WHERE casting.libelle = 'Jeanne Moreau'
UNION
SELECT film.titre
FROM film
         JOIN film_genre ON film.id = film_genre.film_id
         JOIN genre ON film_genre.genre_id = genre.id
WHERE genre.nom LIKE '%Horreur%';

-- 11
SELECT titre
FROM film
         --on joint vers genre
         JOIN film_genre ON film_genre.film_id = film.id
         JOIN genre ON film_genre.genre_id = genre.id
WHERE genre.nom ='Horreur-Epouvante'
INTERSECT
SELECT titre
FROM film
         --on joint vers genre
         JOIN film_genre ON film_genre.film_id = film.id
         JOIN genre ON film_genre.genre_id = genre.id
WHERE genre.nom ='Comédie';

-- 12
SELECT casting.libelle, COUNT(real_film.film_id) somme
FROM film
         JOIN real_film ON real_film.film_id = film.id
         JOIN casting ON casting.id = real_film.casting_id
GROUP BY casting.id
ORDER BY somme DESC;

-- 13
SELECT pays.nom, COUNT(film.id) AS total
FROM film
         JOIN film_pays ON film.id = film_pays.film_id
         JOIN pays ON film_pays.pays_id = pays.id
GROUP BY pays.nom
ORDER BY total DESC;

-- 14
Select pays.nom, count(film)
from film
         JOIN film_pays on film.id=film_pays.film_id
         JOIN pays on film_pays.pays_id=pays.id
group by pays.nom
HAVING  count(film) BETWEEN 1 and 2
order by count(film) Desc;

-- 15
SELECT c.libelle, avg(film.annee)
from film
         join real_film rf on film.id = rf.film_id
         join casting c on c.id = rf.casting_id
group by c.libelle
order by c.libelle;

-- 16
SELECT casting.libelle, MIN(film.annee), MAX(film.annee)
FROM film
         JOIN acteur_film ON film.id = acteur_film.film_id
         JOIN casting ON acteur_film.casting_id = casting.id
GROUP BY casting.libelle
ORDER BY casting.libelle;

-- 17
SELECT
    film.titre AS titre_film,
    (
        SELECT COUNT(*)
        FROM film_pays
        WHERE film_pays.film_id = film.id
    ) AS nombre_pays_associes,
    (
        SELECT COUNT(*)
        FROM film_genre
        WHERE film_genre.film_id = film.id
    ) AS nombre_genres_associes
FROM film;

-- 18
SELECT  f.*
FROM    film f
            JOIN real_film rf on f.id = rf.film_id
            JOIN casting c on rf.casting_id = c.id
WHERE   c.libelle LIKE '%Tarantino%'
        AND f.id NOT IN (
            SELECT  f2.id
            FROM    film f2
                        JOIN film_genre fg on f2.id = fg.film_id
                        JOIN genre g on fg.genre_id = g.id
            WHERE   g.nom='Action'
        );