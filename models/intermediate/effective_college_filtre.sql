SELECT pk, 
uai, 
annee,
code_dep,
code_region,
nb_eleves 
FROM {{ ref('stg_clean__effectif_colleges') }}
WHERE annee = 2022