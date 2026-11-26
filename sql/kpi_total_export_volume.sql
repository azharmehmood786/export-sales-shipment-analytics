## Business Question:
##How many units of products were exported?
query="""
SELECT SUM(quantity) AS total_export_volume
FROM orders
WHERE order_type = 'Export';
"""