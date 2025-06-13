
WITH annuaire_new as
(
SELECT  uai, 
type_etablissement, 
nom_etablissement,
code_dep, 
departement, 
code_region, 
region, 
segpa, 
rep, 
position, 
latitude, 
longitude, 
has_pial,
section_arts, 
section_theatre, 
section_sport, 
`section_internationale ` as section_internationale,
section_europeenne, 
lycee_agricole, 
lycee_militaire, 
lycee_des_metiers, 
statut
FROM `ts2g-462411.clean.annuaire` 
WHERE type_etablissement IN ('Lycée', 'Collège')
)

SELECT
uai, 
type_etablissement, 
nom_etablissement,
LPAD(code_dep, 3, '0') as code_dep, 
departement, 
code_region, 
region, 
segpa, 
rep, 
has_pial,
position, 
latitude, 
longitude, 
CASE
  WHEN NOT (
    section_arts = 1 OR 
    section_theatre = 1 OR 
    section_sport = 1 OR 
    section_internationale = 1 OR 
    section_europeenne = 1 OR 
    lycee_agricole = 1 OR 
    lycee_militaire = 1 OR 
    lycee_des_metiers = 1
  )
  THEN 'aucune option'
  ELSE RTRIM(CONCAT(
    IF(section_arts = 1, 'section arts, ', ''),
    IF(section_theatre = 1, 'section théâtre, ', ''),
    IF(section_sport = 1, 'section sport, ', ''),
    IF(section_internationale = 1, 'section internationale, ', ''),
    IF(section_europeenne = 1, 'section européenne, ', ''),
    IF(lycee_agricole = 1, 'lycée agricole, ', ''),
    IF(lycee_militaire = 1, 'lycée militaire, ', ''),
    IF(lycee_des_metiers = 1, 'lycée des métiers, ', '')
  ), ', ')
END AS options_speciales
FROM annuaire_new
