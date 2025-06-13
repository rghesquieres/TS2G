WITH ivalips AS(
SELECT

ips.*,
iva.nb_0,
iva.nb_presents_all,
iva.taux_reussite_all,
iva.taux_mention_all,
iva.taux_acces_2_0,
iva.taux_acces_1_bac,
iva.taux_acces_0_bac,
iva.nb_mention_tb_g,
nb_mention_tb_t,
iva.mention_tb_total,
iva.va_taux_reussite_all,
iva.va_taux_acces_2_0,
iva.va_taux_mention_all,
iva.va_taux_acces_1_bac,
iva.va_taux_acces_0_bac,

FROM {{ ref('ips_lycees_all') }} AS ips
LEFT JOIN {{ ref('iva_lycees_all') }} AS iva
ON CONCAT (ips.annee,"_", ips.uai) = iva.pk

WHERE ips.code_dep IN ("075", "077", "078", "091", "092", "093", "094", "095")
)

SELECT
    ivalips.*,
    dep.departement,
    dep.dep_geography
FROM ivalips
LEFT JOIN {{ ref('departement_geographie') }} as dep
    USING(code_dep)
