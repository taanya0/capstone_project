-- Create a permanent Gold table for order-status analysis
-- Store this model as a permanent table in dbt_dev
{{ config(
    materialized='table',
    
) }}
-- Calculate order and revenue metrics by status
SELECT
    COALESCE(order_status, 'UNKNOWN') AS order_status,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales_amount), 2) AS total_sales

-- Read cleaned records from the staging model
FROM {{ ref('stg_orders') }}

-- Group the results by order status
GROUP BY COALESCE(order_status, 'UNKNOWN')