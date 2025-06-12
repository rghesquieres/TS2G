SELECT
  ips.uai,

  -- Conversion des années : 2020 → 2021, 2021 → 2022
  CASE 
    WHEN ips.annee = 2020 THEN 2021
    WHEN ips.annee = 2021 THEN 2022
    ELSE ips.annee
  END AS annee,

   -- code dep standardisé
  CASE
    WHEN ips.uai LIKE '62%' THEN '2A'
    WHEN ips.uai LIKE '72%' THEN '2B'
    ELSE LPAD(ips.code_dep, 3, '0')
  END AS code_dep,
  
  ips.ips_all AS ips,
  ips.ips_sigma_gt AS ips_sigma

FROM {{ source('clean', 'IPS_lycees') }} AS ips

WHERE ips.annee IN (2020, 2021)
  AND ips.code_dep IN ("75", "77", "78", "91", "92", "93", "94", "95")
