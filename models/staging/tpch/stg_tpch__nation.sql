with tpch_nation as
(
    select *
    from {{ source('tpch', 'nation') }}
)
select
    N_NATIONKEY as nation_key,
    N_NAME as nation,
    N_REGIONKEY as region_key
from tpch_nation