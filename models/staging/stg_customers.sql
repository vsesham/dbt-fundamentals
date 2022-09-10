{{ 
    config(
        materialized='view'
)
}}

with customers as
(
select
    id as customer_id,
    first_name,
    last_name
from {{ source('source_db','customers') }}
)
select * from customers