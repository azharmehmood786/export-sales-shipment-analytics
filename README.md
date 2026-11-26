
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

###1. Total Export Volume:
   SUM(quantity) WHERE order_type = 'Export'

### 3. On-Time Shipment Rate

SUM(CASE WHEN actual_ship_date <= promised_ship_date THEN 1 ELSE 0 END) / COUNT(order_id) * 100

WHERE order_type = 'Export'
AND actual_ship_date IS NOT NULL

###3. On-Time Shipment Rate:
   (On-Time Export Shipments / Total Shipped Export Orders) * 100
   WHERE order_type = 'Export'
   AND actual_ship_date IS NOT NULL
