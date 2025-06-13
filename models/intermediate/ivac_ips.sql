SELECT ipsc.*,
ivac.pk,
ivac.nb_candidats_g,
ivac.taux_reussite_g,
ivac.note_g,
ivac.taux_acces_6_3,
ivac.nb_mention_tb_g,
ivac.nb_mention_g,
ivac.va_taux_reussite_g,
ivac.va_note_g,
ivac.mentions_total
FROM {{ ref('ips_colleges_all') }} AS ipsc
LEFT JOIN {{ ref('iva_colleges_all') }}AS ivac
ON CONCAT (ipsc.annee,"_", ipsc.uai) = ivac.pk