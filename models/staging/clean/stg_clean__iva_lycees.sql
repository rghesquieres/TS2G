with 

source as (

    select * from {{ source('clean', 'iva_lycees') }}

),

renamed as (

    select
        annee,
        uai,
        code_region,
        nb_presents_all,
        taux_reussite_all,
        va_taux_reussite_all,
        taux_acces_2_0,
        va_taux_acces_2_0,
        taux_mention_all,
        va_taux_mention_all,
        nb_2,
        nb_1,
        nb_0,
        taux_acces_1_bac,
        taux_acces_0_bac,
        va_taux_acces_1_bac,
        va_taux_acces_0_bac,
        nb_mention_tb_g,
        nb_metion_tb_t,
        code_dep,
        code_commune

    from source

)

select * from renamed
