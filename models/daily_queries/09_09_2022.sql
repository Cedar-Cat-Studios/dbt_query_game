-- Show me a single column and record that displays the number of loyalty members we have?

select 
    count(*) as total_loyalty_members
from {{ ref('customers') }}
where is_loyalty_member