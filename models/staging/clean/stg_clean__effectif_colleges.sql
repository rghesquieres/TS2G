with 

source as (

    select * from {{ source('clean', 'effectif_colleges') }}

),

renamed as (

    select
        pk,
        uai,
        annee,
        code_dep,
        code_academie,
        code_region,
        code_postal,
        rep,
        rep_plus,
        nb_eleves,
        nb_3_all,
        nb_3,
        nb_3_segpa,
        nb_3_ulis

    from source

)

select * from renamed
