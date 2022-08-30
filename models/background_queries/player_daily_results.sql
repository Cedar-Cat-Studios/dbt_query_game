select 
    count(*) as total_attempts, 
    count(case when attempts = 1 then 1 end) as first_count, 
    count(case when attempts = 2 then 1 end) as second_count, 
    count(case when attempts = 3 then 1 end) as third_count, 
    count(case when attempts = 4 then 1 end) as fourth_count, 
    count(case when attempts = 5 then 1 end) as fifth_count 
from  {{ source('query_game','player_results') }}
where player_id = "{{ var('playerID') }}"