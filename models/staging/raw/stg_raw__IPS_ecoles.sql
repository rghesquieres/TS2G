with 

source as (

    select * from {{ source('raw', 'IPS_ecoles') }}

),

renamed as (

    select
        uai,
        annee,
        code_dep,
        code_insee,
        ips

    from source

)

select * from renamed
