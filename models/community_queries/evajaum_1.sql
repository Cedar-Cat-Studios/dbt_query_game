-- Show me a single column and record on which day of the week we had the most employee shifts.
select
    day_of_week
from {{ ref('employee_shifts') }}
group by 1
order by count(id) desc
limit 1
