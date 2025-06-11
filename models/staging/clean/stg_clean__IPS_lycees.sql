with 

source as (

    select * from {{ source('clean', 'IPS_lycees') }}

),

renamed as (

    select
        uai,
        annee,
        code_dep,
        code_insee,
        ips_gt,
        ips_pro,
        ips_all,
        ips_sigma_gt,
        ips_sigma_pro,
        pk

    from source

)

select * from renamed
