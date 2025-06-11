with 

source as (

    select * from {{ source('clean', 'brevet_par_etablissement') }}

),

renamed as (

    select
        annee,
        nb_etablissement,
        type_etablissement,
        secteur_enseignement,
        commune,
        code_departement,
        code_academie,
        code_region,
        libelle_region,
        inscrits,
        presents,
        admis,
        admis_sans_mention,
        nombre_d_admis_mention_ab,
        admis_mention_bien,
        admis_mention_tres_bien,
        taux_de_reussite

    from source

)

select * from renamed
