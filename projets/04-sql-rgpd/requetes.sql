/* =========================================================
   Projet 4 – Collectez des données en respectant les normes RGPD
   Auteur : Leslie Deluy
   ========================================================= */

/* Requête 1 : Extraction brute des dossiers complets 2022 */
SELECT *
FROM crm 
WHERE date_demande LIKE '%2022%' 
  AND etat_dossier = 'complet';

/* Requête 2 : Extraction avec anonymisation (RGPD compliant) */
SELECT 
 sexe,
 enfant_conduite_accompagne,
 CASE 
   WHEN CAST(NULLIF(nombre_enfants, '') AS integer) > 0 THEN 'Oui'
   ELSE 'Non'
 END AS enfants,
 CASE 
   WHEN revenus IS NULL OR revenus = '' THEN 'non renseigné'
   WHEN CAST(revenus AS integer) < 20000 THEN '[0-20k]'
   WHEN CAST(revenus AS integer) < 40000 THEN '[20k-40k]'
   WHEN CAST(revenus AS integer) < 60000 THEN '[40k-60k]'
   WHEN CAST(revenus AS integer) < 80000 THEN '[60k-80k]'
   ELSE '[80k+]'
 END AS tranche_revenus,
 CASE
   WHEN DATE_PART('year', AGE(date_naissance::date)) < 20 THEN '<20'
   WHEN DATE_PART('year', AGE(date_naissance::date)) BETWEEN 20 AND 29 THEN '[20-29]'
   WHEN DATE_PART('year', AGE(date_naissance::date)) BETWEEN 30 AND 39 THEN '[30-39]'
   WHEN DATE_PART('year', AGE(date_naissance::date)) BETWEEN 40 AND 49 THEN '[40-49]'
   WHEN DATE_PART('year', AGE(date_naissance::date)) BETWEEN 50 AND 59 THEN '[50-59]'
   ELSE '60+'
 END AS tranche_age,
 formation,
 usage_vehicule,
 type_vehicule,
 est_rouge,
 points_perdus,
 age_vehicule,
 type_conduite,
 date_demande,
 etat_dossier,
 formule
FROM crm
WHERE date_part('year', date_demande::date) = 2022
  AND etat_dossier = 'complet';
