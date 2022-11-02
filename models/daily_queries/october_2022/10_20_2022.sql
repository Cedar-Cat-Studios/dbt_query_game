-- What is the first and last name of each employee that works on Friday?
select distinct
    employees.first_name,
    employees.last_name
from {{ ref('employees') }}
left join {{ ref('employee_shifts') }}
    on employees.id = employee_shifts.employee_id
where employee_shifts.day_of_week = "FRI"