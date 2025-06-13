SELECT
  uai,
  CASE -- Transformation d’année : 2020 → 2021, 2021 → 2022
    WHEN annee = 2020 THEN 2021
    WHEN annee = 2021 THEN 2022
    ELSE annee
  END AS annee,

    code_dep,
    ips,
    ips_sigma,

FROM {{ ref('stg_clean__IPS_colleges') }}

WHERE annee IN (2021, 2022) AND code_dep IN ("075", "077", "078", "091", "092", "093", "094", "095")
