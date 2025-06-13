WITH table2023 AS (
  SELECT
    * EXCEPT(annee, code_academie, academie, departement, code_dep),
    annee - 1 AS annee,
    CAST(code_dep AS STRING) as code_dep
  FROM {{ ref('stg_clean__baccalaureat_par_departement') }}
  WHERE
    voie IN ("Générale", "Technologique")
    AND annee = 2023
)
SELECT
    annee,
    LPAD(CASE
        WHEN code_dep LIKE "620" THEN "2A"
        WHEN code_dep LIKE "720" THEN "2B"
        ELSE code_dep
    END,3,'0') AS code_dep,
    * EXCEPT(annee, code_dep),
FROM table2023
