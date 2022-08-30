-- What are the first and last names of all employees and the city in which they are located?
select
  first_name,
  last_name,
  city
from {{ ref('employees') }}
left join {{ ref('locations') }}
  on employees.location_id = locations.id
