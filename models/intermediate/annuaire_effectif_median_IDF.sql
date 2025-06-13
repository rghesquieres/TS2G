WITH median AS(
SELECT 
    code_dep,
    type_etablissement,
    PERCENTILE_CONT(nb_eleves,0.5) OVER (PARTITION BY CAST(code_dep AS INT64)) AS mediane_nb_eleve
FROM {{ ref('jointure_annuaire_IDF') }}
WHERE nb_eleves IS NOT NULL
), code_depmed AS(
SELECT
    code_dep,
    type_etablissement,
    ROUND(AVG(mediane_nb_eleve),0) as mediane_nb_eleve 
FROM median
GROUP BY
    code_dep,
    type_etablissement
)
SELECT
code_region,
an.code_dep,
uai,
an.type_etablissement,
nom_etablissement,
ulis,
segpa,
rep,
has_pial,
statut,
options_speciales,
dep_geography,
departement,
region,
    CASE
        WHEN an.nb_eleves IS NULL THEN CAST(med.mediane_nb_eleve AS INT64)
        ELSE an.nb_eleves
    END AS nb_eleves
FROM {{ ref('jointure_annuaire_IDF') }} as an
LEFT JOIN code_depmed as med
    ON an.code_dep=med.code_dep AND an.type_etablissement=med.type_etablissement
