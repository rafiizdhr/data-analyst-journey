-- after checking nulls, dup, canellation transaction, negative quantity or price, 
-- this part make new one table for cleaned transaction
CREATE TABLE cleaned_transactions AS
SELECT DISTINCT *
FROM raw_transactions
WHERE "Customer ID" IS NOT NULL
    AND Invoice NOT LIKE 'C%'
    AND Quantity > 0
    AND Price > 0;