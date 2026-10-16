CREATE TAbLE serveurs(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL

);

CREATE TABLE tables(
    id SERIAL PRIMARY KEY,
    numero INT NOT NULL
);

ALTER TABLE commandes ADD COLUMN id_serveur INT,
ADD CONSTRAINT fk_serveur_commande
FOREIGN KEY (id_serveur) REFERENCES serveurs(id);

ALTER TABLE commandes ALTER COLUMN id_serveur SET NOT NULL;

ALTER TABLE commandes ADD COLUMN id_table INT,
ADD CONSTRAINT fk_table_commande
FOREIGN KEY (id_table) REFERENCES tables(id);

INSERT INTO serveurs (nom, prenom) VALUES
('Njaka', 'Rakoto'),
('Lala', 'Rasoa');

INSERT INTO tables (numero) VALUES
(1),
(2),
(3);


UPDATE commandes SET id_serveur = 1, id_table = 1 WHERE id = 1;
UPDATE commandes SET id_serveur = 2, id_table = 2 WHERE id = 2;
