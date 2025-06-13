SELECT
    uai,
    annee,
    LPAD(code_dep, 3, '0') AS code_dep, -- transforme le 'taille' de la string 'code_dep'  
    rep,
    rep_plus,	
    nb_eleves,	
    nb_3_all,	
    nb_3,
    nb_3_segpa,
    nb_3_ulis,

FROM {{ ref('stg_clean__effectif_colleges') }}
WHERE annee IN (2021, 2022) AND LPAD(code_dep, 3, '0') IN ("075", "077", "078", "091", "092", "093", "094", "095")