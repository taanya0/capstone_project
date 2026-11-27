-- Materialize the city-level sales summary as a permanent table
-- Store this model as a permanent table in dbt_dev
{{ config(
    materialized='table',
    
) }}

-- Calculate sales and order metrics for each city
SELECT
    city,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales_amount), 2) AS total_sales
FROM {{ ref('stg_orders') }}

-- Group results by city
GROUP BY city