with 

source as (

    select * from {{ source('clean', 'baccalaureat_par_academie') }}

),

renamed as (

    select
        annee,
        code_academie,
        genre,
        statut_candidat,
        branche,
        serie,
        nb_inscrits,
        nb_presents,
        nb_admis_1er_grp,
        nb_refuse_1er_grp,
        nb_admis_2d_grp,
        nb_refuse_2d_grp,
        nb_admis_total,
        nb_admis_mention_b,
        nb_admis_mention_ab,
        nb_admis_mention_no,
        nb_refuse_total,
        nb_admis_mention_tb

    from source

)

select * from renamed
