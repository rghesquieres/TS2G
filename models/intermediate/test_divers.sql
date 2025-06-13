SELECT 
  a.*,

   CASE 
    WHEN a.type_etablissement = 'Collège' THEN ec.annee
    WHEN a.type_etablissement = 'Lycée' THEN el.annee
  END AS annee,

  
  CASE 
    WHEN a.type_etablissement = 'Collège' THEN ec.nb_eleves
    WHEN a.type_etablissement = 'Lycée' THEN el.nb_eleves
  END AS nb_eleves,

  IFNULL(ec.nb_3_segpa, 0) AS nb_3_segpa,
  IFNULL(ec.nb_3_ulis, 0) AS nb_3_ulis,

     IFNULL(el.nb_0_g, 0) AS nb_0_g,
  IFNULL(el.nb_0_t, 0) AS nb_0_t
FROM {{ ref('Exploration') }} AS a

LEFT JOIN {{ ref('stg_clean__effectif_colleges') }} AS ec
  ON a.uai = ec.uai AND a.type_etablissement = 'Collège'

LEFT JOIN {{ ref('stg_clean__effectif_lycee') }} AS el
  ON a.uai = el.uai AND a.type_etablissement = 'Lycée'
