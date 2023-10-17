with 

source as (

    select * from {{ source('snowflake', 'dishes') }}

),

renamed as (

    select
        identifier,
        name,
        selling_price,
        production_cost,
        type

    from source

)

select * from renamed
