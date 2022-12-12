{{
    config(
        materialized='incremental',
        unique_key='customer_id'
    )
}}

select
    customer_id,
    first_name,
    last_name,
    created_at,
    created_by,
    modified_at,
    modified_by
from {{ source('jaffle_source', 'customer_inc') }}
{% if is_incremental() %}
where modified_at > (select max(modified_at) from {{ this }})
{% endif %}

