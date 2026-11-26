# Export Business Analytics

## Project Overview
Analysis of export business orders, products, customers, and shipment performance using Python, Pandas, SQLite, and SQL.

## Dataset
- Products
- Customers
- Orders
- Dates

## Tools
- Python
- Pandas
- NumPy
- SQLite
- SQL
- Jupyter Notebook

## Key Performance Indicators

### 1. Total Export Volume

**Business Question:** How many units of products were exported?

**Formula:**
```sql
SUM(quantity)
WHERE order_type = 'Export'
```

### 2. Average Order Value

**Business Question:** What is the average value of export orders?

**Formula:**
```sql
AVG(total_amount_usd)
WHERE order_type = 'Export'
```

### 3. On-Time Shipment Rate

**Business Question:** What percentage of shipped export orders were shipped on time?

**Formula:**
```sql
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
```

## Dataset Files and Row Counts

The `/data` folder contains:

| File Name | Rows |
|---|---:|
| Orders.csv | 500 |
| Products.csv | 4 |
| Customers.csv | 20 |
| Dates.csv | Pending verification |

## SQLite Database

The `exports.db` file is located in the repository root.

It contains three tables:
- orders
- products
- customers

## Project Structure

```text
Export-Business-Analytics/
├── data/
│   ├── Orders.csv
│   ├── Products.csv
│   ├── Customers.csv
│   └── Dates.csv
├── sql/
│   ├── kpi_total_export_volume.sql
│   ├── kpi_average_order_value.sql
│   └── kpi_on_time_shipment_rate.sql
├── analysis.ipynb
├── exports.db
└── README.md
```
