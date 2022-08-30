-- What is our total number of lifetime customers?
select
    count(id) as total_customers
from {{ ref('customers') }}