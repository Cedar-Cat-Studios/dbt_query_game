-- How much money have we brought in from cash payments? I only care about the cash payment type and the total amount.

select 
    payment_method,
    sum(amount) as total_amount
from {{ ref('payments') }}
where payment_method = "cash"
group by 1