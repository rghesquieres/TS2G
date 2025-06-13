SELECT pk, 
uai, 
annee,
LPAD(code_dep, 3, '0') AS code_dep,
code_region,
nb_eleves,
nb_3
FROM {{ ref('stg_clean__effectif_colleges') }}
WHERE annee IN (2022)