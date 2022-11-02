-- Show me each employee by first name and their average order value. Oh and can you round to the nearest hundreth for the average order value.

select
    employees.first_name,
    round(avg(order_lines.amount),2) as avg_order_value
from {{ ref('employees') }}
left join {{ ref('orders') }}
    on employees.id = orders.employee_id
left join {{ ref('order_lines') }}
    on order_lines.order_id = orders.id
group by 1
order by 2 desc