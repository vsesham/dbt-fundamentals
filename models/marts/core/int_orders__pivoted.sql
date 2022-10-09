{%- set payment_methods = ['bank_transfer','credit_card','coupon','gift_card'] -%}

with payments as
(
    select * from {{ ref('stg_payments') }}
),
pivoted as
(
    select
        order_id,
        {%- for payment_method in payment_methods %}
        sum(case when paymentmethod = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_payment
        {%- if not loop.last -%}
        ,
        {%- endif %}
        {%- endfor %}
    from payments
    where status = 'success'
    group by 1
)
select * from pivoted