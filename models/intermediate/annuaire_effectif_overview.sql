SELECT
    uai,
    type_etablissement,
    an.code_dep,
    code_region,
    ulis,
    segpa,
    rep,
    has_pial,
    options_speciales,
    nb_eleves,
    statut,
    geo.departement
FROM {{ ref('annuaire_effectif') }} as an
LEFT JOIN {{ ref('departement_geographie') }} as geo
    USING(code_dep)
WHERE nb_eleves IS NOT NULL
    AND geo.departement IS NOT NULL

