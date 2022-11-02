-- Show me the day and total number of orders sold for the day we sold the most orders.

select 
    order_date,
    count(id) as total_orders
from {{ ref('orders') }}
group by 1
order by 2 desc
limit 1