with 

source as (

    select * from {{ source('clean', 'effectif_college') }}

),

renamed as (

    select

    from source

)

select * from renamed
