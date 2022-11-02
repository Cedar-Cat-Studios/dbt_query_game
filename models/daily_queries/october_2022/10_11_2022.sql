-- I really need to know for each day how many orders and how much money we have made?

select 
    orders.order_date,
    sum(order_lines.amount) as total_amount,
    count(order_lines.order_id) as total_orders
from {{ ref('order_lines') }}
left join {{ ref('orders') }}
    on orders.id = order_lines.order_id
group by 1