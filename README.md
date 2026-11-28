# Export Business Analytics

## Project Overview

An end-to-end export analytics project to analyze export orders, products, customers, and shipment performance using Python, Pandas, SQLite, and SQL.

The project focuses on building a structured export analytics database, performing data quality checks, and generating monthly export performance summaries.

## Dataset

The project uses four datasets:

- Orders
- Products
- Customers
- Dates

## Tools & Technologies

- Python
- Pandas
- NumPy
- SQLite
- SQL
- Jupyter Notebook
- GitHub

## Key Performance Indicators (KPIs)

### 1. Total Export Volume

Measures the total quantity of products exported.

**Formula:**
`SUM(quantity)` where `order_type = 'Export'`

### 2. Average Order Value (AOV)

Measures the average sales value per export order.

**Formula:**
`AVG(total_amount_usd)` where `order_type = 'Export'`

### 3. On-Time Shipment Rate

Measures the percentage of export orders shipped on or before the promised date.

**Formula:**
`(On-Time Orders / Total Shipped Orders) * 100`

## Dataset Files and Row Counts

| File Name | Rows |
|---|---:|
| Orders.csv | 500 |
| Products.csv | 4 |
| Customers.csv | 20 |
| Dates.csv | 500 |

## SQLite Database

The `exports.db` database is located in the repository root.

It contains the following star schema tables:

- `DimProduct`
- `DimCustomer`
- `DimDate`
- `FactExportOrders`
- `monthly_export_summary`

The dimension tables store product, customer, and date information, while the fact table stores export order details.

## Data Quality Checks

Two data quality checks are implemented:

1. **Negative Quantity Check:** Identifies records with negative quantities.
2. **NULL Foreign Key Check:** Identifies records with missing `customer_id`, `product_id`, or `order_date`.

Python validation checks the results and uses `sys.exit(1)` to stop execution if either check fails.

Both checks passed during validation.

## Monthly Export Summary

The monthly export summary includes:

- Total Export Volume
- Average Order Value
- Previous Month Export Volume

The SQL query uses a Common Table Expression (CTE) and the `LAG()` window function to calculate previous month's export volume.

The results are exported to `monthly_export_summary.csv`.

## Project Structure

```text
export-sales-shipment-analytics/
│
├── data/
│   ├── Orders.csv
│   ├── Products.csv
│   ├── Customers.csv
│   └── Dates.csv
│
├── sql/
│
├── star_schema/
│   ├── 01_create_star_schema.sql
│   ├── 02_monthly_export_summary.sql
│   ├── 03_check_negative_quantity.sql
│   ├── 04_check_null_foreign_keys.sql
│   └── monthly_export_summary.csv
│
├── KPI_Definitions.md
├── analysis.ipynb
├── exports.db
└── README.md
```

## Project Outcome

The project provides a structured SQLite star schema, data quality validation, and a monthly export summary to support export performance analysis and reporting.
