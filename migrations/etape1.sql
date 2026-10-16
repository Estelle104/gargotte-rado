CREATE DATABASE gargotte_rado;

CREATE TABLE IF NOT EXISTS cartes (
    id INT PRIMARY KEY,
    plat VARCHAR(255) NOT NULL,
    categorie VARCHAR(255) NOT NULL,
    prix INT NOT NULL
    
);

CREATE SEQUENCE cartes_id_seq OWNED BY cartes.id;
ALTER TABLE cartes ALTER COLUMN id SET DEFAULT nextval('cartes_id_seq');
SELECT setval('cartes_id_seq', COALESCE((SELECT MAX(id) FROM cartes), 0) + 1, false);


INSERT INTO cartes (id, plat, categorie, prix) VALUES
(1, 'Romazava', 'Plat malagasy', 7000),
(2, 'Ravitoto sy henakisoa', 'Plat malagasy', 8000),
(3, 'Akoho sy voanio', 'Plat malagasy', 8500),
(4, 'Mi sao', 'Plat chinois', 6000),
(5, 'Soupe chinoise', 'Soupe', 5000),
(6, 'Mofo gasy (les 4)', 'Dessert et goûter', 1000),
(7, 'Ranon''ampango', 'Boisson', 500);