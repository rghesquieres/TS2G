WITH dep AS (
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
    geo.departement,
    geo.dep_geography
FROM {{ ref('annuaire_effectif') }} as an
LEFT JOIN {{ ref('departement_geographie') }} as geo
    USING(code_dep)
WHERE nb_eleves IS NOT NULL
    AND geo.departement IS NOT NULL
)
SELECT
    dep.*,
    reg.region,
    reg.reg_geography,
FROM dep
LEFT JOIN {{ ref('stg_clean__region_geographie') }} as reg
    USING(code_region)