-- How many store locations do we have?
select
    count(id) as total_locations
from {{ ref('locations') }}