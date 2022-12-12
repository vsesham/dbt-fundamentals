{{
    config(
        materialized='ephemeral'
    )
}}

with customer_nation_region as
(
    select
        region.region_key,
        region.region,
        nation.nation_key,
        nation.nation,
        customer.customer_key,
        customer.customer_name,
        customer.customer_account_balance,
        customer.customer_market_segment
    from {{ ref('stg_tpch__customer') }} as customer
        inner join {{ ref('stg_tpch__nation') }} as nation
            on customer.customer_nation_key = nation.nation_key
        inner join {{ ref('stg_tpch__region') }} as region
            on nation.region_key = region.region_key
)

select
    *
from customer_nation_region