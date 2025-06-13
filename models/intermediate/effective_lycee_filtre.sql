SELECT pk,
uai,
annee, 
code_dep,
code_region,
secteur, 
nb_eleves
FROM {{ ref('stg_clean__effectif_lycee') }}
WHERE annee = 2022