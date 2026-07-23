-- Check nulls
SELECT 
    SUM(CASE WHEN 'Customer ID' IS NULL THEN 1 ELSE 0 END) AS null_customer,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS null_description
FROM raw_transactions;

-- Identify cancellations (Invoice starts with 'C'
SELECT COUNT(*) FROM raw_transactions WHERE Invoice LIKE 'C%';

-- Create cleaned table: remove cancellations, nulls in CustomerID, negative/zero quantity or price
CREATE TABLE cleaned_transactions AS
SELECT * 
FROM raw_transactions
WHERE 'Customer ID' IS NOT NULL
    AND Invoice NOT LIKE 'C%'
    AND Quantity > 0 
    AND Price > 0;

-- Add computed column: line revenue
ALTER TABLE cleaned_transactions ADD COLUMN LineRevenue REAL;
UPDATE cleaned_transactions SET LineRevenue = Quantity * Price;