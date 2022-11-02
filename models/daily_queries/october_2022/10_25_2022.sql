-- Provide the first name, last name, and total number survey responses for each customer.

select
    customers.first_name,
    customers.last_name,
    count(*) as total_responses
from {{ ref('survey_results') }}
left join {{ ref('customers') }}
    on survey_results.customer_id = customers.id
group by 1, 2