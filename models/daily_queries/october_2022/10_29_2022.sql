-- What day has the fewest number of shifts, excluding weekends. I want to see the day of the week and the total number of shifts for that day.

select 
    day_of_week,
    count(id) as total_shifts
from {{ ref('employee_shifts') }}
where day_of_week not in ("SUN","SAT")
group by 1
order by 2
limit 1