
# Export Business Analytics

## Project Overview
Analysis of export business orders, products,
customers and shipment performance using Python, Pandas, SQLite and SQL.

## Dataset
- Products
- Customers
- Orders
-Dates
## Tools
- Python
- Pandas
- SQLite
- SQL

## Key Performance Indicators

1. Total Export Volume

Business Question: How many units of products were exported?

Formula:

SUM(quantity)
WHERE order_type = 'Export'

2. Average Order Value

Business Question: What is the average value of export orders?

Formula:

AVG(total_amount_usd)
WHERE order_type = 'Export'

3. On-Time Shipment Rate

Business Question: What percentage of shipped export orders were shipped on time?

Formula:

ROUND(
    100.0 * SUM(
        CASE
            WHEN actual_ship_date <= promised_ship_date
            THEN 1 ELSE 0
        END
    ) / COUNT(order_id),
    2
)
WHERE order_type = 'Export'
AND actual_ship_date IS NOT NULL
