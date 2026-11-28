-- Data Quality Check: NULL Foreign Keys

CREATE TEMP TABLE dq_null_check (id INTEGER);

CREATE TEMP TRIGGER check_null_foreign_keys
BEFORE INSERT ON dq_null_check
WHEN EXISTS (
    SELECT 1
    FROM FactExportOrders
    WHERE customer_id IS NULL
       OR product_id IS NULL
       OR order_date IS NULL
)
BEGIN
    SELECT RAISE(ABORT, 'ERROR: NULL foreign keys found!');
END;

INSERT INTO dq_null_check VALUES (1);

DROP TRIGGER check_null_foreign_keys;
DROP TABLE dq_null_check;
