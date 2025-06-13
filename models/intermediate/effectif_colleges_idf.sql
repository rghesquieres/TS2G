SELECT
    pk, 
    uai, 
    annee,
    LPAD(code_dep, 3, '0') AS code_dep,
    code_region,
    nb_eleves,
    nb_3
FROM {{ ref('stg_clean__effectif_colleges') }}
WHERE annee IN (2021, 2022) AND LPAD(code_dep, 3, '0') IN ("075", "077", "078", "091", "092", "093", "094", "095")