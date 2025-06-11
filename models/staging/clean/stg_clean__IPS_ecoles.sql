with 

source as (

    select * from {{ source('clean', 'IPS_ecoles') }}

),

renamed as (

    select
        uai,
        annee,
        code_dep,
        code_insee,
        ips,
        pk

    from source

)

select * from renamed
