with tpch_customer as (
    select *
    from {{ source('tpch', 'customer') }}
)

select
    C_CUSTKEY as customer_key,
    replace(C_NAME,'Customer#','') as customer_name,
    C_NATIONKEY as customer_nation_key,
    C_PHONE as customer_phone,
    C_ACCTBAL as customer_account_balance,
    C_MKTSEGMENT as customer_market_segment
from tpch_customer