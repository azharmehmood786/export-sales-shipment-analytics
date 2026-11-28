import sys
import sqlite3

conn = sqlite3.connect("exports.db")

cursor = conn.cursor()

cursor.execute("""
SELECT COUNT(*)
FROM FactExportOrders
WHERE quantity < 0;
""")

count = cursor.fetchone()[0]

if count > 0:
    print("ERROR: Negative quantities found!")
    sys.exit(1)
else:
    print("PASS: No negative quantities found.")

conn.close()
