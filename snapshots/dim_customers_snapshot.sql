{% snapshot dim_customers_snapshot %}
    {{
        config(
            target_schema='snapshots',
            strategy='check',
            unique_key='customer_id',
            check_cols=['first_name', 'last_name'],
        )
    }}
    select * from {{ ref('stg_customers') }}
{% endsnapshot %}