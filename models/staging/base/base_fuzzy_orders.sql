select distinct
    parse_json(dishes_names)::array as dishes_names
    , payment_method
    , amount
    , created_at
from 
    {{ source('snowflake', 'fuzzy_orders') }}