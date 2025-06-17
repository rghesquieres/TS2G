WITH ivac AS(
SELECT
    uai,
    "Collège" AS type_etablissement,
    code_dep,
    departement,
    taux_reussite_g,
FROM {{ ref('ivac_ips_IDF') }}
)
SELECT
    i.*,
    an.ulis,
    an.segpa,
    CASE
        WHEN an.rep IS NULL THEN 0
        WHEN an.rep IS NOT NULL THEN 1
    END AS rep,
    statut,
    options_speciales,
    nb_eleves
FROM ivac as i
INNER JOIN {{ ref('annuaire_effectif_median_IDF') }} as an
    USING(uai)
-- UNION ALL

-- SELECT
--     uai,
--     "Lycée" AS type_etablissement,
--     code_dep,
--     departement,
-- FROM {{ ref('ival_ips_IDF') }}
