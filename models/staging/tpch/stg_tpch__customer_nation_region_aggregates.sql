SELECT
cnr.*,
aabn.average_account_balance as avg_acct_bal_by_nation
    FROM {{ref('stg_tpch__customer_nation_region')}} as cnr
        JOIN {{ref('stg_tpch__average_acctbal_by_nation')}} as aabn
        ON
        aabn.nation_key = cnr.nation_key