with 

source as (

    select * from {{ source('raw', 'iva_colleges') }}

),

renamed as (

    select
        annee,
        uai,
        code_reg_academie,
        code_academie,
        code_dep,
        nb_candidats_g,
        taux_reussite_g,
        va_taux_reussite_g,
        nb_candidats_p,
        taux_reussite_p,
        note_g,
        va_note_g,
        note_p,
        taux_acces_6_3,
        part_3_total,
        part_3_g,
        part_3_p,
        part_3_segpa,
        nb_mention_tb_g,
        nb_mention_g

    from source

)

select * from renamed
