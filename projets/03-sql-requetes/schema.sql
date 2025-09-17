/* =========================================================
   Schéma simplifié du Projet 3 – Base Contrats & Régions
   ========================================================= */

CREATE TABLE region (
    code_dep_code_commune VARCHAR(10) PRIMARY KEY,
    dep_code VARCHAR(3),
    reg_nom VARCHAR(100),
    com_nom_maj_court VARCHAR(100)
);

CREATE TABLE contrat (
    contrat_id INT PRIMARY KEY,
    code_dep_code_commune VARCHAR(10),
    type_contrat VARCHAR(50),
    formule VARCHAR(50),
    type_local VARCHAR(50),
    surface DECIMAL(10,2),
    prix_cotisation_mensuel DECIMAL(10,2),
    categorie_valeur_declaree VARCHAR(50),
    FOREIGN KEY (code_dep_code_commune) REFERENCES region(code_dep_code_commune)
);
