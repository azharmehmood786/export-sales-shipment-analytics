#Business Question:
#What percentage of export orders were shipped on time?
query="""
SELECT
ROUND(
100.0 * SUM(CASE WHEN actual_ship_date <= promised_ship_date
THEN 1 ELSE 0 END) / COUNT(*), 2
) AS on_time_shipment_rate
FROM orders
WHERE order_type = 'Export';
"""