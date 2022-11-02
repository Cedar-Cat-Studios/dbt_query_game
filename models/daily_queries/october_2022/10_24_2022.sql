-- Please provide a single record and column indicating the number of British Jaffles our customers have ordered.

select
    count(*) as total_jaffles
from {{ ref('order_lines') }}
left join {{ ref('orders') }}
    on order_lines.order_id = orders.id
left join {{ ref('customers') }}
    on orders.customer_id = customers.id
where order_lines.name = "British Jaffle"