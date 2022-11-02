-- Show me all the fields and records on our orders table.

select *
from {{ ref('orders') }}