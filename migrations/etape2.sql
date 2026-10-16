CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY,
    libele VARCHAR(255) NOT NULL
);

-- supprimer "categorie" de "cartes"
ALTER TABLE cartes DROP COLUMN categorie;

-- ajouter id_catogorie comme Foreign_key dans "cartes" 
ALTER TABLE cartes ADD column id_categorie INT, 
ADD CONSTRAINT fk_cartes_categorie
FOREIGN KEY (id_categorie) REFERENCES categories(id);

-- rendre non null le id_categorie
ALTER TABLE cartes ALTER COLUMN id_categorie SET NOT NULL;


-- donnee categorie
INSERT INTO categories (id, libele) VALUES
(1, 'Plat malagasy'),
(2, 'Plat chinois'),
(3, 'Soupe'),
(4, 'Dessert et goûter'),
(5, 'Boisson');

-- mettre l'id de la categorie dans cartes
UPDATE cartes SET id_categorie = 1 WHERE plat IN ('Romazava', 'Ravitoto sy henakisoa', 'Akoho sy voanio');
UPDATE cartes SET id_categorie = 2 WHERE plat = 'Mi sao';
UPDATE cartes SET id_categorie = 3 WHERE plat = 'Soupe chinoise';
UPDATE cartes SET id_categorie = 4 WHERE plat = 'Mofo gasy (les 4)';
UPDATE cartes SET id_categorie = 5 WHERE plat = 'Ranon''ampango';