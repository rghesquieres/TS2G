SELECT
    dep_geography,
    LPAD(CAST(code_dep AS STRING), 3, '0') as code_dep,
    departement
FROM {{ ref('stg_clean__departements_geographie') }}