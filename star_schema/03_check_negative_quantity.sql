
CREATE TEMP TABLE dq_check (
    result INTEGER CHECK (result = 1)
);

INSERT INTO dq_check
SELECT CASE
    WHEN COUNT(*) = 0 THEN 1
    ELSE 0
END
FROM FactExportOrders
WHERE quantity <= 0;
