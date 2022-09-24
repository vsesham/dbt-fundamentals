with customers as
(
select
    id as customer_id,
    first_name,
    last_name
from {{ source('jaffle_source','customers') }}
)
select * from customers