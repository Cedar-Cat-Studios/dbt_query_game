with partition_prep as (
    select 
        *, 
        case when date_diff(attempt_time,lag(attempt_time) over (partition by player_id order by attempt_time), day) > 1
        or date_diff(attempt_time,lag(attempt_time) over (partition by player_id order by attempt_time), day) is null
            then 1
            else null
        end as steak_identifier
    from {{ source('query_game','player_results') }}
    where player_id = "{{ var('playerID') }}"
    and is_solved = 1
), 

streak_set as (
    select
        attempt_time,
        steak_identifier,
        row_number() over (order by attempt_time) as streak_order
    from partition_prep
    where steak_identifier = 1
),

streak_backfill as (
    select
        partition_prep.date,
        partition_prep.player_id,
        partition_prep.attempt_time,
        last_value(streak_set.streak_order ignore nulls) over (order by partition_prep.attempt_time range between unbounded preceding and current row) as streak_run
    from partition_prep
    left join streak_set
        on streak_set.attempt_time = partition_prep.attempt_time
), 

streak_tally as (
    select 
        streak_run,
        count(streak_run) as streak
    from streak_backfill
    group by 1
), 

best_streak_marker as (
    select 
        max(streak) as best_streak
    from streak_tally
), 

current_streak_marker as (
    select
        streak as current_streak_total
    from streak_tally
    where streak_run = (select max(streak_run) from streak_backfill)
)

select *
from current_streak_marker
cross join best_streak_marker