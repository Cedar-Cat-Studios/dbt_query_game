-- Show me each payment type used across our stores, and the total amount each has processed.

select
    payment_method,
    sum(amount) as total_amount
from {{ ref('payments') }}
group by 1
order by 2 desc