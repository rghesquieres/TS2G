WITH jointure_dep AS(
SELECT
    * EXCEPT(position, latitude, longitude)
FROM {{ ref('annuaire_effectif') }}
LEFT JOIN {{ ref('departement_geographie') }}
    USING(code_dep)
)
SELECT
 * EXCEPT(reg_geography)
FROM jointure_dep
LEFT JOIN {{ ref('stg_clean__region_geographie') }}
    USING (code_region)
WHERE region = "Île-de-France"
