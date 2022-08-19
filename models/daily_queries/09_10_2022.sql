-- What is our best all time selling item?
select 
    name,
    count(id) as total_units
from {{ source('query_game','order_lines') }}
group by 1
order by total_units desc
limit 1