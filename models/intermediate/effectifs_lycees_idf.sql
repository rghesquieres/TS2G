SELECT
  effectif_lycees.uai,
  effectif_lycees.pk,
  effectif_lycees.annee,

  -- code dep standardisé
  CASE
    WHEN effectif_lycees.uai LIKE '62%' THEN '2A'
    WHEN effectif_lycees.uai LIKE '72%' THEN '2B'
    ELSE LPAD(effectif_lycees.code_dep, 3, '0')
  END AS code_dep,
  
  effectif_lycees.code_region,
  effectif_lycees.secteur,
  effectif_lycees.nb_eleves AS eleves_totaux,
  effectif_lycees.nb_0_g,
  effectif_lycees.nb_0_t,
  effectif_lycees.nb_0_g + effectif_lycees.nb_0_t AS nb_0


FROM {{ source('clean', 'effectif_lycee') }} AS effectif_lycees
WHERE effectif_lycees.annee IN (2020, 2021)
AND effectif_lycees.code_dep IN ("75", "77", "78", "91", "92", "93", "94", "95")