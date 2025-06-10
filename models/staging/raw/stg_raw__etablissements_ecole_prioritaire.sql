with 

source as (

    select * from {{ source('raw', 'etablissements_ecole_prioritaire') }}

),

renamed as (

    select
        uai,
        ep_2022_2023,
        uai_tete_reseau,
        qp_prox_on,
        qp_prox,
        code_post,
        code_commune,
        code_dep,
        code_academie,
        code_region,
        code_nature,
        position,
        latitude,
        longitude

    from source

)

select * from renamed
