-- Provide each employees first name and each start and end time of their shifts.

select 
    employees.first_name,
    employee_shifts.start_at,
    employee_shifts.end_at
from {{ ref('employees') }}
left join {{ ref('employee_shifts') }}
    on employees.id = employee_shifts.employee_id