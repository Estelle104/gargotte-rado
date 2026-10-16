CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) DEFAULT 'client de passage',
    prenom VARCHAR(255)
);

INSERT INTO clients ( nom, prenom) VALUES
('Rakoto', 'Rak'),
('Rasoa', 'Rasoa'),
('Rabe', 'Rabe');

ALTER TABLE commandes ADD COLUMN id_client INT, 
ADD CONSTRAINT fk_client_commande
FOREIGN KEY (id_client) REFERENCES clients(id);
 

UPDATE commandes SET id_client = 1 WHERE id = 1;
UPDATE commandes SET id_client = 2 WHERE id = 2;