SELECT
  uai,
  pk,
  annee,

  -- code dep standardisé
  CASE
    WHEN uai LIKE '62%' THEN '2A'
    WHEN uai LIKE '72%' THEN '2B'
    ELSE LPAD(code_dep, 3, '0')
  END AS code_dep,
  
  code_region,
  secteur,
  nb_eleves AS eleves_totaux,
  nb_0_g,
  nb_0_t,
  nb_0_g + nb_0_t AS nb_0


FROM {{ source('clean', 'effectif_lycee') }}
WHERE
    annee IN (2022)
    AND code_dep IN ("75", "77", "78", "91", "92", "93", "94", "95")
