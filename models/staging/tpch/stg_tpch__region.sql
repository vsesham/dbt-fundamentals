with tpch_region as
(
    SELECT
        *
    FROM {{source('tpch', 'region')}}
)
SELECT
    R_REGIONKEY as region_key,
    R_NAME as region
FROM tpch_region