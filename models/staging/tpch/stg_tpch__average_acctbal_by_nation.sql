{{
    config(
        materialized='ephemeral'
    )
}}

SELECT
nation_key,
avg(customer_account_balance) as average_account_balance
    FROM {{ref('stg_tpch__customer_nation_region')}}
        GROUP BY
        nation_key