-- What is the name and order date of all our order lines?

select 
    order_lines.name,
    orders.order_date
from {{ ref('order_lines') }}
left join {{ ref('orders') }}
    on orders.id = order_lines.order_id