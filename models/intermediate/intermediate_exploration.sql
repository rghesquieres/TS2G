
WITH annuaire_new as
(
SELECT
uai, 
type_etablissement, 
nom_etablissement,
code_dep,  
code_region, 
IF(ulis = 1, 1, 0) as ulis,
IF(segpa = 1, 1, 0) as segpa,
rep, 
position, 
latitude, 
longitude, 
has_pial,
IF(restauration = 1, 1, 0) as restauration,
IF(hebergement = 1, 1, 0) as hebergement,
IF(section_arts = 1, 1, 0) as section_arts,
IF(section_theatre = 1, 1, 0) as section_theatre,
IF(section_sport = 1, 1, 0) as section_sport,
IF(section_internationale = 1, 1, 0) as section_internationale,
IF(section_europeenne = 1, 1, 0) as section_europeenne,
IF(lycee_agricole = 1, 1, 0) as lycee_agricole,
IF(lycee_militaire = 1, 1, 0) as lycee_militaire,
IF(lycee_des_metiers = 1, 1, 0) as lycee_des_metiers,
statut
FROM `ts2g-462411.clean.annuaire` 
)

SELECT
uai, 
type_etablissement, 
nom_etablissement,
LPAD(code_dep, 3, '0') as code_dep, 
code_region,
ulis,
segpa, 
rep, 
has_pial,
position, 
latitude, 
longitude, 
CASE
  WHEN NOT (
    restauration = 1 OR
    hebergement = 1 OR
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
    IF(section_arts = 1, 'arts, ', ''),
    IF(section_theatre = 1, 'théâtre, ', ''),
    IF(section_sport = 1, 'sport, ', ''),
    IF(section_internationale = 1, 'internationale, ', ''),
    IF(section_europeenne = 1, 'européenne, ', ''),
    IF(lycee_agricole = 1, 'lycée agricole, ', ''),
    IF(lycee_militaire = 1, 'lycée militaire, ', ''),
    IF(lycee_des_metiers = 1, 'lycée des métiers, ', '')
  ), ', ')
END AS options_speciales
FROM annuaire_new
