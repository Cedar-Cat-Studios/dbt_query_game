-- Provide me with the first name, last name, and date hired for all our employees.

select 
    employees.first_name,
    employees.last_name,
    employees.date_hired
from {{ ref('employees') }}
