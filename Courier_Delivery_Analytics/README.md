# Courier Delivery Analytics

## 1. Project Overview
This project focuses on processing and analysing courier delivery data using Databricks and dbt. It follows a Medallion Architecture consisting of Bronze, Silver and Gold layers.

## 2. Technologies Used
- Databricks
- PySpark
- SQL
- dbt Cloud
- Delta Lake
- GitHub

## 3. Project Architecture

**Source:** Initial and incremental CSV files.

**Bronze Layer:**
- Loads raw CSV data.
- Performs data validation.
- Identifies and stores rejected records.
- Maintains batch audit information.

**Silver Layer:**
- Cleans and standardises data.
- Converts columns into appropriate data types.
- Removes duplicate order IDs.
- Performs incremental MERGE operations.

**SCD Type 2:**
- Uses dbt snapshots to maintain historical versions of order records.

**Gold Layer:**
- Creates analytical models using dbt.
- Sales by city.
- Sales by product.
- Orders by status.

## 4. Data Quality Rules
Records are rejected for:
- Missing order ID.
- Missing customer ID.
- Missing product ID.
- Missing or invalid quantity.
- Missing or invalid unit price.
- Missing or invalid sales amount.
- Missing or blank order status.

## 5. Business Metrics
- Total orders.
- Total quantity.
- Total sales.
- Sales by city.
- Sales by product.
- Order status distribution.

## 6. dbt Models
- stg_orders
- gold_sales_by_city
- gold_sales_by_product
- gold_orders_by_status

## 7. Data Storage
Databricks catalog: `courier_delivery`

Schemas:
- source
- bronze
- silver
- gold
- snapshot
- dbt_dev

## 8. Project Outcome
The project demonstrates data ingestion, validation, transformation, incremental processing, historical tracking, analytical modelling and data quality testing.