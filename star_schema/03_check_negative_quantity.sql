-- Data Quality Check: Negative Quantity

CREATE TEMP TABLE dq_negative_check (id INTEGER);

CREATE TEMP TRIGGER check_negative_quantity
BEFORE INSERT ON dq_negative_check
WHEN EXISTS (
    SELECT 1
    FROM FactExportOrders
    WHERE quantity < 0
)
BEGIN
    SELECT RAISE(ABORT, 'ERROR: Negative quantities found!');
END;

INSERT INTO dq_negative_check VALUES (1);

DROP TRIGGER check_negative_quantity;
DROP TABLE dq_negative_check;
