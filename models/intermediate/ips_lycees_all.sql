SELECT
  ips.uai,

  -- transfo d’année : 2020 → 2021, 2021 → 2022
  CASE 
    WHEN ips.annee = 2020 THEN 2021
    WHEN ips.annee = 2021 THEN 2022
    ELSE ips.annee
  END AS annee,

  ips.ips_all AS ips,
  ips.ips_sigma_gt AS ips_sigma,

  -- code dep standardisé
  CASE
    WHEN ips.uai LIKE '62%' THEN '2A'
    WHEN ips.uai LIKE '72%' THEN '2B'
    ELSE LPAD(ips.code_dep, 3, '0')
  END AS code_dep

FROM {{ source('clean', 'IPS_lycees') }} AS ips
WHERE ips.annee IN (2020, 2021)
