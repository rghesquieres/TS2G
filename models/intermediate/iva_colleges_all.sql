SELECT 
  pk,
  annee,
  uai,
  nb_candidats_g,
  taux_reussite_g,
  note_g,
  taux_acces_6_3,
  nb_mention_tb_g,
  nb_mention_g,
  va_taux_reussite_g,
  va_note_g,
  LPAD(code_dep, 3, '0') AS code_dep, -- transforme le 'taille' de la string 'code_dep' 
  nb_mention_tb_g + nb_mention_g AS mentions_total

FROM {{ ref('stg_clean__iva_colleges') }}
WHERE annee in (2022)