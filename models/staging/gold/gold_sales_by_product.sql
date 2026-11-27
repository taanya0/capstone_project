-- Create a permanent Gold table for product-level sales analysis
-- Store this model as a permanent table in dbt_dev
{{ config(
    materialized='table',
    
) }}

-- Calculate order, quantity and revenue metrics for each product
SELECT
    product_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales_amount), 2) AS total_sales,
    ROUND(AVG(unit_price), 2) AS average_unit_price

-- Read cleaned records from the staging model
FROM {{ ref('stg_orders') }}

-- Group the results by product
GROUP BY product_id