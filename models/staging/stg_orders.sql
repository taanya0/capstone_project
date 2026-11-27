
-- Materialise the staging model as a view
{{ config(materialized='view') }}

-- Read the orders table from the Silver layer
SELECT
    order_id,
    order_date,
    customer_id,
    product_id,
    city,
    payment_method,
    quantity,
    unit_price,
    discount_pct,
    sales_amount,
    order_status,
    updated_at,
    batch_id,
    source_file,
    ingestion_timestamp

-- Reference the Silver source defined in sources.yml
FROM {{ source('courier_silver', 'orders') }}
