{% set payment_methods = dbt_utils.get_column_values(table=ref('base_orders'), column='payment_method') %}

select 
 restaurants.name,
 {% for payment_method in payment_methods %}
 SUM(CASE WHEN orders.payment_method = '{{ payment_method }}' THEN orders.amount END) AS {{ payment_method }},
 {% endfor %}
 sum(orders.amount) as total_money
from {{ ref('base_orders') }} as orders
inner join {{ ref('base_restaurants')}} as restaurants
on orders.restaurant_identifier = restaurants.identifier
group by restaurants.name
limit {{ var('nb_restaurants_to_show')}}