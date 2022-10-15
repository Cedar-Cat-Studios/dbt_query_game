-- Which countries do we have stores in and how many locations are in each state?

select
    country,
    count(*) as total_countries
from {{ ref('locations') }}
group by 1