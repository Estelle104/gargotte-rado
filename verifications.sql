-- ETAPE 1
select * from cartes order by prix desc;

--  id |         plat          |     categorie     | prix 
-- ----+-----------------------+-------------------+------
--   3 | Akoho sy voanio       | Plat malagasy     | 8500
--   2 | Ravitoto sy henakisoa | Plat malagasy     | 8000
--   1 | Romazava              | Plat malagasy     | 7000
--   4 | Mi sao                | Plat chinois      | 6000
--   5 | Soupe chinoise        | Soupe             | 5000
--   6 | Mofo gasy (les 4)     | Dessert et goûter | 1000
--   7 | Ranon'ampango         | Boisson           |  500
-- (7 rows)


-- ETAPE 2
SELECT cat.libele AS categorie, COUNT(c.id) AS nombre_plats FROM categories cat
LEFT JOIN cartes c ON c.id_categorie = cat.id GROUP BY cat.id, cat.libele ORDER BY cat.id;

--      categorie     | nombre_plats 
-- -------------------+--------------
--  Plat malagasy     |            3
--  Plat chinois      |            1
--  Soupe             |            1
--  Dessert et goûter |            1
--  Boisson           |            1
-- (5 rows)

-- gargotte_rado=# 




-- ETAPE 3
select c.id, c.date_commande, SUM(dc.quantite * p.prix) as total_commande 
from commandes AS c JOIN details_commandes dc ON c.id = dc.id_commande 
JOIN cartes p ON dc.id_plat = p.id GROUP BY c.id, c.date_commande;

--  id | date_commande | total_commande 
-- ----+---------------+----------------
--   2 | 2026-10-16    |          37000
--   1 | 2026-10-16    |          21500
-- (2 rows)


-- ETAPE 4
select  c.id, c.date_commande, COALESCE(cl.nom, 'client de passage') as nom, COALESCE(cl.prenom, 'inconnu') as prenom
from commandes AS c
LEFT JOIN clients cl ON c.id_client = cl.id;

-- nom  
-- ----+---------------+-------------------+---------
--   3 | 2026-10-16    | client de passage | inconnu
--   1 | 2026-10-16    | Rakoto            | Rak
--   2 | 2026-10-16    | Rasoa             | Rasoa
-- (3 rows)

-- gargotte_rado=# 

-- ETAPE 5
select s.id, s.nom, s.prenom , SUM(dc.quantite*p.prix) as chiffre_affaire, COUNT(DISTINCT c.id) as nombre_commandes 
from serveurs s LEFT JOIN commandes c ON s.id = c.id_serveur
LEFT JOIN details_commandes dc ON c.id = dc.id_commande
LEFT JOIN cartes p ON dc.id_plat = p.id
GROUP BY s.id, s.nom, s.prenom ORDER BY chiffre_affaire DESC;

--  id |  nom  | prenom | chiffre_affaire | nombre_commandes 
-- ----+-------+--------+-----------------+------------------
--   2 | Lala  | Rasoa  |           37000 |                1
--   1 | Njaka | Rakoto |           21500 |                1
-- (2 rows)
