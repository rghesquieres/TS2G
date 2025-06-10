with 

source as (

    select * from {{ source('raw', 'IPS_lycees') }}

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
        ips_sigma_pro

    from source

)

select * from renamed
