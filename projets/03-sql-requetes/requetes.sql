/* =========================================================
   Projet 3 – Requêtez une base de données avec SQL
   Auteur : Leslie Deluy
   Note : adapter au besoin les noms exacts de tables/colonnes
         (contrat, region, code_dep_code_commune, etc.)
   ========================================================= */

/* Q1. Lister les numéros de contrats et leur surface pour la commune de CAEN */
SELECT c.contrat_id, c.surface
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
WHERE r.com_nom_maj_court = 'CAEN';

/* Q2. Numéros de contrats + type de contrat + formule pour les maisons du département 71 */
SELECT c.contrat_id, c.type_contrat, c.formule, c.type_local, r.dep_code
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
WHERE c.type_local = 'Maison'
  AND r.dep_code = '71';

/* Q3. Lister le nom des régions de France (sans doublon) */
SELECT DISTINCT r.reg_nom
FROM region r
WHERE r.reg_nom IS NOT NULL
ORDER BY r.reg_nom;

/* Q4. Les 5 contrats ayant les plus grandes surfaces */
SELECT c.contrat_id, c.surface
FROM contrat c
ORDER BY c.surface DESC
LIMIT 5;

/* Q5. Prix moyen de la cotisation mensuelle (arrondi 2 décimales) */
SELECT ROUND(AVG(c.prix_cotisation_mensuel), 2) AS prix_moyen_cotisation
FROM contrat c;

/* Q6. Nombre de contrats par catégorie de valeur déclarée des biens
   (adapter le nom de la colonne catégorielle si différent) */
SELECT c.categorie_valeur_declaree, COUNT(*) AS nb_contrats
FROM contrat c
GROUP BY c.categorie_valeur_declaree
ORDER BY nb_contrats DESC;

/* Q7. Nombre de contrats avec formule 'Integral' sur la région 'Pays de la Loire' */
SELECT COUNT(*) AS nb_integral_pays_loire
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
WHERE c.formule = 'Integral'
  AND r.reg_nom = 'Pays de la Loire';

/* Q8. (Variante de Q2) Contrats + type + formule pour maisons du 71 via GROUP BY/HAVING */
SELECT
  c.contrat_id, c.type_contrat, c.formule, c.type_local, r.dep_code
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
GROUP BY c.contrat_id, c.type_contrat, c.formule, c.type_local, r.dep_code
HAVING c.type_local = 'Maison' AND r.dep_code = '71';

/* Q9. Surface moyenne des contrats à Paris (tous arrondissements) */
SELECT ROUND(AVG(c.surface), 2) AS surface_moyenne_paris
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
WHERE r.com_nom_maj_court LIKE 'PARIS%';

/* Q10. Top 10 départements par prix moyen de cotisation mensuelle (décroissant) */
SELECT r.dep_code,
       ROUND(AVG(c.prix_cotisation_mensuel), 2) AS prix_moyen_cotisation
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
GROUP BY r.dep_code
ORDER BY prix_moyen_cotisation DESC
LIMIT 10;

/* Q11. Communes ayant eu au moins 150 contrats */
SELECT r.com_nom_maj_court AS commune, COUNT(*) AS nb_contrats
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
GROUP BY r.com_nom_maj_court
HAVING COUNT(*) >= 150
ORDER BY nb_contrats DESC;

/* Q12. Nombre de contrats par région (décroissant) */
SELECT r.reg_nom, COUNT(*) AS nb_contrats
FROM contrat c
JOIN region r ON r.code_dep_code_commune = c.code_dep_code_commune
GROUP BY r.reg_nom
ORDER BY nb_contrats DESC;
