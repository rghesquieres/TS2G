with 

source as (

    select * from {{ source('clean', 'etablissements_ecole_prioritaire') }}

),

renamed as (

    select
        uai,
        ep_2022_2023,
        qp_prox_on,
        qp_prox

    from source

)

select * from renamed
