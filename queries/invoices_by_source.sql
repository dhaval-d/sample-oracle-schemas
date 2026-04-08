-- Query: Invoices by Source
-- Description: Count and total amount of invoices grouped by their source (e.g., MANUAL, EDI).

SELECT 
    source,
    COUNT(invoice_id) AS invoice_count,
    SUM(invoice_amount) AS total_amount
FROM 
    invoices
WHERE 
    source IS NOT NULL
GROUP BY 
    source
ORDER BY 
    invoice_count DESC;
