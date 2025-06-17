WITH ivac AS(
SELECT
    code_dep,
    COUNT(uai) AS nb_etablissements_c,
    ROUND(AVG(va_taux_reussite_g),2) as va_taux_reussite_g,
    ROUND(AVG(va_note_g),2) as va_note_g,
    ROUND(AVG(va_taux_reussite_g + va_note_g),2) as va_totale_c,
FROM {{ ref('ivac_ips_IDF') }}
GROUP BY
    code_dep
),
ival AS(
SELECT
    code_dep,
    COUNT(uai) as nb_etablissements_l,
    ROUND(AVG(va_taux_reussite_all),2) AS va_taux_reussite_all,
    ROUND(AVG(va_taux_acces_2_0),2) AS va_taux_acces_2_0,
    ROUND(AVG(va_taux_mention_all),2) AS va_taux_mention_all,
    ROUND(AVG(va_taux_acces_1_bac),2) AS va_taux_acces_2_bac,
    ROUND(AVG(va_taux_acces_0_bac),2) AS va_taux_acces_0_bac,
    ROUND(AVG(va_taux_reussite_all + va_taux_acces_2_0 + va_taux_mention_all + va_taux_acces_1_bac + va_taux_acces_0_bac)) AS va_totale_l
FROM {{ ref('ival_ips_IDF') }} as l
GROUP BY
    code_dep
),
jointure AS(
SELECT
    *
FROM ivac
INNER JOIN ival
    USING(code_dep)
)
SELECT
    j.*,
    dep.departement,
    dep.dep_geography
FROM jointure as j
INNER JOIN {{ ref('departement_geographie') }} as dep
    USING(code_dep)