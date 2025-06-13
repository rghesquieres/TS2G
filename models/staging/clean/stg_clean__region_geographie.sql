with 

source as (

    select * from {{ source('clean', 'region_geographie') }}

),

renamed as (

    select
        reg_geography,
        code_region,
        region

    from source

)

select * from renamed
