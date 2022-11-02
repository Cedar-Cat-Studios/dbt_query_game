-- I hear the Libertyville, IL store location is haunted. Can you show me the first and last name of all of our employees that work there? We shouldn't have any, but want to check just in case.

select 
    first_name,
    last_name
from sql_puzzle.employees
left join sql_puzzle.locations
    on employees.location_id = locations.id
where locations.city = "Libertyville"