SELECT 
    restaurant.name,
    SUM(CASE WHEN orders.payment_method = 'cash' THEN orders.amount ELSE 0 END) AS sum_amount_cash,
    SUM(CASE WHEN orders.payment_method = 'card' THEN orders.amount ELSE 0 END) AS sum_amount_card,
    SUM(CASE WHEN orders.payment_method = 'cheque' THEN orders.amount ELSE 0 END) AS sum_amount_cheque,
    SUM(CASE WHEN orders.payment_method = 'meal_ticket' THEN orders.amount ELSE 0 END) AS sum_amount_meal_ticket
FROM {{ref("base_orders")}} AS orders
INNER JOIN {{ref("base_restaurants")}} AS restaurant
ON orders.restaurant_identifier = restaurant.identifier
WHERE orders.payment_method IN ('cash', 'card', 'meal_ticket','cheque')
GROUP BY restaurant.name
limit {{var('nb_restaurants_to_show')}}