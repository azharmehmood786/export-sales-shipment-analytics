
-- 1. Product Dimension
CREATE TABLE IF NOT EXISTS DimProduct (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    unit_price_usd REAL
);

-- 2. Customer Dimension
CREATE TABLE IF NOT EXISTS DimCustomer (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    country TEXT
);

-- 3. Date Dimension
CREATE TABLE IF NOT EXISTS DimDate (
    date TEXT PRIMARY KEY,
    day INTEGER,
    month INTEGER,
    month_name TEXT,
    quarter INTEGER,
    year INTEGER,
    day_name TEXT,
    is_weekend INTEGER
);

-- 4. Export Orders Fact Table
CREATE TABLE IF NOT EXISTS FactExportOrders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    order_date TEXT,
    promised_ship_date TEXT,
    actual_ship_date TEXT,
    quantity INTEGER,
    unit_price_usd REAL,
    total_amount_usd REAL,
    order_type TEXT,

    FOREIGN KEY (customer_id) REFERENCES DimCustomer(customer_id),
    FOREIGN KEY (product_id) REFERENCES DimProduct(product_id),
    FOREIGN KEY (order_date) REFERENCES DimDate(date),
    FOREIGN KEY (promised_ship_date) REFERENCES DimDate(date),
    FOREIGN KEY (actual_ship_date) REFERENCES DimDate(date)
);
