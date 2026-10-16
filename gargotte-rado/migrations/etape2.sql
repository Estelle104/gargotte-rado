CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY,
    libele VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS cartes (
    id INT PRIMARY KEY,
    plat VARCHAR(255) NOT NULL,
    id_categorie INT,
    prix BIGINT NOT NULL,
    
    FOREIGN KEY (id_categorie) REFERENCES categories(id)
);