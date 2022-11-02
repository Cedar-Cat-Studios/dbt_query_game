-- Of the customers that have answered our survey, I would like to know their first name, last name, and the highest rating they have given us.

select 
    customers.first_name,
    customers.last_name,
    max(rating) as best_rating
from {{ ref('survey_results') }}
left join {{ ref('customers') }}
    on customers.id = survey_results.customer_id
group by 1, 2