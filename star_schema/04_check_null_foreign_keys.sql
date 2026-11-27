
CREATE TEMP TABLE dq_fk_check (
    result INTEGER CHECK (result = 1)
);

INSERT INTO dq_fk_check
SELECT CASE
    WHEN COUNT(*) = 0 THEN 1
    ELSE 0
END
FROM FactExportOrders
WHERE customer_id IS NULL
   OR product_id IS NULL;
