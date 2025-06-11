with 

source as (

    select * from {{ source('clean', 'effectif_lycee') }}

),

renamed as (

    select
        pk,
        uai,
        annee,
        code_dep,
        code_academie,
        code_reg_academie,
        code_postal,
        secteur,
        nb_eleves,
        nb_0_g,
        nb_0_t

    from source

)

select * from renamed
