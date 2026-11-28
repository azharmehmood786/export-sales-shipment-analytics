-- Monthly Export Summary

DROP TABLE IF EXISTS monthly_export_summary;

CREATE TABLE monthly_export_summary AS
SELECT
    d.year,
    d.month,
    d.month_name,
    SUM(f.quantity) AS total_export_volume,
    AVG(f.total_amount_usd) AS average_order_value
FROM FactExportOrders f
JOIN DimDate d
    ON f.order_date = d.date
WHERE f.order_type = 'Export'
GROUP BY
    d.year,
    d.month,
    d.month_name
ORDER BY
    d.year,
    d.month;
