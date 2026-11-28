# Export Business Analytics

## Project Overview

An end-to-end export analytics project to analyze export orders, products, customers, and shipment performance using Python, Pandas, SQLite, and SQL.

## Dataset

- Orders
- Products
- Customers
- Dates

## Tools

- Python
- Pandas
- NumPy
- SQLite
- SQL
- Jupyter Notebook
- GitHub

## Key Performance Indicators

### 1. Total Export Volume
Measures the total quantity of products exported.

**Formula:** `SUM(quantity)` where `order_type = 'Export'`

### 2. Average Order Value (AOV)
Measures the average sales value per export order.

**Formula:** `AVG(total_amount_usd)` where `order_type = 'Export'`

### 3. On-Time Shipment Rate
Measures the percentage of export orders shipped on or before the promised date.

**Formula:** `(On-Time Orders / Total Shipped Orders) * 100`

## Dataset Files and Row Counts

| **File Name** | **Rows** |
|---------------|----------|
| Orders.csv    | 500      |
| Products.csv  | 4        |
| Customers.csv | 20       |
| Dates.csv     | 500      |

## SQLite Database

The `exports.db` database is located in the repository root.

It contains the following star schema tables:

- DimProduct
- DimCustomer
- DimDate
- FactExportOrders
- monthly_export_summary

## Monthly Export Summary

The monthly summary includes:

- Total Export Volume
- Average Order Value
- Previous Month Export Volume

The results are also exported to `monthly_export_summary.csv`.

## Project Structure

```text
export-sales-shipment-analytics/
├── data/
│   ├── Orders.csv
│   ├── Products.csv
│   ├── Customers.csv
│   └── Dates.csv
├── sql/
├── star_schema/
│   ├── 01_create_star_schema.sql
│   ├── 02_monthly_export_summary.sql
│   ├── 03_check_negative_quantity.sql
│   └── 04_check_null_foreign_keys.sql
├── KPI_Definitions.md
├── monthly_export_summary.csv
├── analysis.ipynb
├── exports.db
└── README.md
