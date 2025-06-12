select
    * EXCEPT(serie)
FROM {{ ref('stg_clean__baccalaureat_par_academie') }}
WHERE
    statut_candidat IN ("SCOLAIRE", "APPRENTISSAGE")
    AND     annee IN (2021, 2022)
    AND     branche IN ("BAC GENERAL", "BAC TECHNOLOGIQUE")
ORDER BY
    annee,
    code_academie,
    branche
    