/* =========================================================
   Projet 5 – Suivi Satisfaction Client
   Schéma relationnel simplifié (PostgreSQL)
   Auteur : Leslie Deluy
   ========================================================= */

CREATE TABLE produit (
    cle_produit INT PRIMARY KEY,
    categorie VARCHAR(50),
    typologie VARCHAR(50)
);

CREATE TABLE ref_magasin (
    ref_magasin INT PRIMARY KEY,
    nom_magasin VARCHAR(100),
    departement VARCHAR(50)
);

CREATE TABLE retour_client (
    cle_retour_client INT PRIMARY KEY,
    cle_produit INT REFERENCES produit(cle_produit),
    ref_magasin INT REFERENCES ref_magasin(ref_magasin),
    source VARCHAR(50),
    note INT CHECK (note BETWEEN 0 AND 10),
    date_achat DATE,
    commentaire TEXT
);
