Select restaurant.name, sum(orders.amount) as sum_amount_cash
from {{ref("base_orders")}} as orders
inner join {{ref("base_restaurants")}} as restaurant
On orders.restaurant_identifier = restaurant.identifier
Group by restaurant.name 
limit 3