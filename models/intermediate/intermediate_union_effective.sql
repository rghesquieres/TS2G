SELECT
  'lycee' AS type_etablissement,
  pk,
  uai,
  annee,
  code_dep,
  code_region,
  nb_eleves
FROM {{ ref('effectif_lycees') }}

UNION ALL

SELECT
  'college' AS type_etablissement,
  pk,
  uai,
  annee,
  code_dep,
  code_region,
  nb_eleves
FROM {{ ref('effectif_college') }}

