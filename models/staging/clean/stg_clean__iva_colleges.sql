with 

source as (

    select * from {{ source('clean', 'iva_colleges') }}

),

renamed as (

    select
        annee,
        uai,
        code_reg_academie,
        code_academie,
        nb_candidats_g,
        taux_reussite_g,
        va_taux_reussite_g,
        note_g,
        va_note_g,
        taux_acces_6_3,
        nb_mention_tb_g,
        nb_mention_g,
        pk,
        code_dep,
        code_commune

    from source

)

select * from renamed
