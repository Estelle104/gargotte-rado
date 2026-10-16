CREATE TABLE commandes (
    id INT PRIMARY KEY SERIAL,
    date_commande DATE NOT NULL,
);

CREATE TABLE details_commandes (
    id INT PRIMARY KEY,
    id_commande INT NOT NULL,
    id_plat INT NOT NULL,
    quantite INT NOT NULL,

    FOREIGN KEY (id_commande) REFERENCES commandes(id),
    FOREIGN KEY (id_plat) REFERENCES cartes(id)
);

-- Table commandes
CREATE SEQUENCE commandes_id_seq OWNED BY commandes.id;
ALTER TABLE commandes ALTER COLUMN id SET DEFAULT nextval('commandes_id_seq');
SELECT setval('commandes_id_seq', COALESCE((SELECT MAX(id) FROM commandes), 0) + 1, false);

-- Table details_commandes
CREATE SEQUENCE details_commandes_id_seq OWNED BY details_commandes.id;
ALTER TABLE details_commandes ALTER COLUMN id SET DEFAULT nextval('details_commandes_id_seq');
SELECT setval('details_commandes_id_seq', COALESCE((SELECT MAX(id) FROM details_commandes), 0) + 1, false);


-- donnee de test
INSERT INTO commandes (id, date_commande) VALUES
(1, '2026-10-16');

INSERT INTO details_commandes (id_commande, id_plat, quantite) VALUES
(1, 1, 2),  -- 2 Romazava
(1, 4, 1),  -- 1 Mi sao
(1, 7, 3);  -- 3 Ranon'ampango

--- 

INSERT INTO commandes (id, date_commande) VALUES
( '2026-10-16');

INSERT INTO details_commandes (id_commande, id_plat, quantite) VALUES
(2, 1, 2),  -- 2 Romazava
(2, 2, 1),  -- 1 Mi sao
(2, 5, 3);  -- 3 Ranon'ampango