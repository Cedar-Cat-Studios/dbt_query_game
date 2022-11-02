-- What are the names and the total units sold for our three worst selling products?

select 
    name,
    count(id) as total_units
from {{ ref('order_lines') }}
group by 1
order by total_units asc
limit 3