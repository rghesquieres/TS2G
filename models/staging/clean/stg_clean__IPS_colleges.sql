with 

source as (

    select * from {{ source('clean', 'IPS_colleges') }}

),

renamed as (

    select
        uai,
        annee,
        code_dep,
        code_insee,
        secteur,
        ips,
        ips_sigma,
        pk

    from source

)

select * from renamed
