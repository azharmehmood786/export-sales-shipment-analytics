import sqlite3
import sys

conn = sqlite3.connect("exports.db")

query = """
SELECT COUNT(*)
FROM FactExportOrders
WHERE customer_id IS NULL
   OR product_id IS NULL
   OR order_date IS NULL;
"""

count = conn.execute(query).fetchone()[0]
conn.close()

if count > 0:
    print(f"ERROR: {count} rows have NULL foreign keys!")
    sys.exit(1)
else:
    print("PASS: No NULL foreign keys found.")
