-- Query: Average Invoice Amount
-- Description: Average invoice amount per supplier.

SELECT 
    s.supplier_name,
    AVG(i.invoice_amount) AS avg_invoice_amount,
    COUNT(i.invoice_id) AS invoice_count
FROM 
    suppliers s
JOIN 
    invoices i ON s.supplier_id = i.supplier_id
GROUP BY 
    s.supplier_name
ORDER BY 
    avg_invoice_amount DESC;
