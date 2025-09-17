/* =========================================================
   Projet 5 – Requêtes SQL Satisfaction Client
   Auteur : Leslie Deluy
   ========================================================= */

-- Retours clients par thématique
SELECT COUNT(*) AS nb_retours_livraison
FROM retour_client
WHERE commentaire ILIKE '%livraison%';

SELECT source, COUNT(*) AS nb_retours
FROM retour_client
GROUP BY source;

SELECT note
FROM retour_client rc
JOIN produit p ON rc.cle_produit = p.cle_produit
WHERE source = 'reseaux_sociaux'
  AND p.categorie = 'TV';

-- Indicateurs de satisfaction
SELECT categorie, ROUND(AVG(note),2) AS note_moyenne
FROM retour_client rc
JOIN produit p ON rc.cle_produit = p.cle_produit
GROUP BY categorie;

SELECT typologie, ROUND(AVG(note),2) AS note_moyenne_sav
FROM retour_client rc
JOIN produit p ON rc.cle_produit = p.cle_produit
WHERE source = 'SAV'
GROUP BY typologie;

SELECT ROUND(AVG(note),2) AS note_moyenne_boissons
FROM retour_client rc
JOIN produit p ON rc.cle_produit = p.cle_produit
WHERE p.categorie = 'Boissons';

SELECT EXTRACT(DOW FROM date_achat) AS jour, ROUND(AVG(note),2) AS note_moyenne
FROM retour_client
GROUP BY jour;

SELECT EXTRACT(MONTH FROM date_achat) AS mois, COUNT(*) AS nb_retours_sav
FROM retour_client
WHERE source = 'SAV'
GROUP BY mois
ORDER BY mois;

-- Performance des magasins
SELECT ref_magasin, ROUND(AVG(note),2) AS note_moyenne
FROM retour_client
GROUP BY ref_magasin
ORDER BY note_moyenne DESC
LIMIT 5;

SELECT ref_magasin, ROUND(AVG(note),2) AS note_moyenne
FROM retour_client
GROUP BY ref_magasin
HAVING ROUND(AVG(note),2) < (SELECT AVG(note) FROM retour_client);

SELECT ref_magasin, COUNT(*) AS nb_feedbacks
FROM retour_client
GROUP BY ref_magasin
ORDER BY nb_feedbacks DESC
LIMIT 5;

SELECT ref_magasin, COUNT(*) AS nb_feedbacks_drive
FROM retour_client
WHERE source = 'Drive'
GROUP BY ref_magasin
HAVING COUNT(*) > 12;

SELECT departement, ROUND(AVG(note),2) AS note_moyenne
FROM retour_client rc
JOIN ref_magasin m ON rc.ref_magasin = m.ref_magasin
GROUP BY departement
ORDER BY note_moyenne DESC;

-- Fidélité client (NPS simplifié)
SELECT ROUND(100.0 * SUM(CASE WHEN note >= 9 THEN 1 ELSE 0 END)/COUNT(*) -
             100.0 * SUM(CASE WHEN note <= 6 THEN 1 ELSE 0 END)/COUNT(*), 2) AS nps_global
FROM retour_client;

SELECT source,
       ROUND(100.0 * SUM*
