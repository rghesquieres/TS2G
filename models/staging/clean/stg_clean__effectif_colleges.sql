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
        code_reg_academie,
        code_postal,
        rep,
        rep_plus,
        nb_eleves_total,
        total_3,
        hors_segpa_hors_ulis_3,
        segpa_3,
        ulis_3

    from source

)

select * from renamed
