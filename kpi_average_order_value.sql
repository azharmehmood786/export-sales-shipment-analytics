###Business Question:
##What is the average value of export orders?
query="""
SELECT AVG(total_amount_usd) AS average_order_value
FROM orders
WHERE order_type = 'Export';
"""