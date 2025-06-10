with 

source as (

    select * from {{ source('raw', 'effectif_lycee') }}

),

renamed as (

    select
        uai,
        annee,
        code_dep,
        code_academie,
        code_reg_academie,
        code_postal,
        secteur,
        nb_eleves,
        nb_0_g,
        nb_0_sti2d,
        nb_0_stl,
        nb_0_stmg,
        nb_0_st2s,
        nb_0_std2a,
        nb_0_sthr,
        nb_0_tmd,
        nb_0_bt

    from source

)

select * from renamed
