
-- Define the SCD Type 2 snapshot
{% snapshot orders_snapshot %}

{{
    config(
        target_schema = 'snapshot',
        unique_key = 'order_id',
        strategy = 'timestamp',
        updated_at = 'updated_at'
    )
}}

-- Read the current order records from the Silver source
SELECT
    order_id,
    customer_id,
    product_id,
    city,
    payment_method,
    quantity,
    unit_price,
    discount_pct,
    sales_amount,
    order_status,
    updated_at

FROM {{ source('courier_silver', 'orders') }}

{% endsnapshot %}
