-- Business Question:
-- What percentage of shipped export orders were shipped on time?

SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN actual_ship_date <= promised_ship_date
                THEN 1 ELSE 0
            END
        ) / COUNT(order_id),
        2
    ) AS on_time_shipment_rate
FROM orders
WHERE order_type = 'Export'
AND actual_ship_date IS NOT NULL;