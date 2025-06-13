SELECT 
  (annee||"_"||uai) as pk,
  annee,
  uai,
  nb_0,
  nb_presents_all,
  taux_reussite_all,
  taux_mention_all,
  taux_acces_2_0,
  taux_acces_1_bac,
  taux_acces_0_bac,
  nb_mention_tb_g,
  nb_metion_tb_t as nb_mention_tb_t,
  (nb_mention_tb_g + nb_metion_tb_t) as mention_tb_total,
  va_taux_reussite_all,
  va_taux_acces_2_0,
  va_taux_mention_all,
  va_taux_acces_1_bac,
  va_taux_acces_0_bac,

  -- code dep strandardisé
  CASE
    WHEN uai LIKE '62%' THEN '2A'
    WHEN uai LIKE '72%' THEN '2B'
    ELSE LPAD(code_dep, 3, '0')
  END AS code_dep

FROM `ts2g-462411.clean.IVA_lycees`
WHERE annee IN (2021, 2022)