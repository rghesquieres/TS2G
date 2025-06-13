with 

source as (

    select * from {{ source('clean', 'departements_geographie') }}

),

renamed as (

    select
        dep_geography,
        code_dep,
        departement

    from source

)

select * from renamed
