-- Show me the First Name and Last Name of all customers who are loalty members.

select 
    first_name,
    last_name
from {{ ref('customers') }}
where is_loyalty_member