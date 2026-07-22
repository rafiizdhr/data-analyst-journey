SELECT 
    SUM(CASE WHEN 'Customer ID' IS NULL THEN 1 ELSE 0 END) AS null_customer,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS null_description
FROM raw_transactions;