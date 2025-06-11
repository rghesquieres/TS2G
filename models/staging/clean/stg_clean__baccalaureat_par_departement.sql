with 

source as (

    select * from {{ source('clean', 'baccalaureat_par_departement') }}

),

renamed as (

    select
        annee,
        code_academie,
        academie,
        code_dep,
        departement,
        voie,
        genre,
        nb_present,
        nb_admis,
        taux_reussite

    from source

)

select * from renamed
