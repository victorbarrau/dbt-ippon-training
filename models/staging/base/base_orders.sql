{{config(materialized = 'table')}}

select distinct * from {{ mockable_source("snowflake","orders","sample_order")}}
