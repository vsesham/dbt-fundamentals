with payments AS
(
SELECT
    ID as PAYMENT_ID, 
    ORDERID as ORDER_ID, 
    PAYMENTMETHOD, 
    STATUS, 
    {{cents_to_dollars('amount',2)}} AS AMOUNT, 
    CREATED, 
    _BATCHED_AT

FROM {{ source('stripe_source','payment') }}
)
select * from payments