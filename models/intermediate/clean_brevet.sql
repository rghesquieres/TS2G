SELECT
    annee -1 as annee,
    nb_etablissement as uai,
    code_departement as code_dep,
    inscrits,
    presents,
    admis,
    admis_sans_mention,
    admis_mention_tres_bien,
    ROUND((admis/presents)*100,1) as taux_reussite
FROM {{ ref('stg_clean__brevet_par_etablissement') }}
WHERE
    annee IN (2021)
    AND code_departement LIKE "02B"