with 

source as (

    select * from {{ source('raw', 'IPS_colleges') }}

),

renamed as (

    select
        uai,
        annee,
        code_dep,
        code_insee,
        secteur,
        ips,
        ips_sigma

    from source

)

select * from renamed
