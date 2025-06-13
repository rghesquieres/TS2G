SELECT
  'lycee' AS type_etablissement,
  pk,
  uai,
  annee,
  code_dep,
  code_region,
  nb_eleves
FROM {{ ref('effective_lycee_filtre') }}

UNION ALL

SELECT
  'college' AS type_etablissement,
  pk,
  uai,
  annee,
  code_dep,
  code_region,
  nb_eleves
FROM {{ ref('effective_college_filtre') }}

