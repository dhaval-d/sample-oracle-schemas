-- Query: Suppliers with Most Invoices
-- Description: Top suppliers ranked by the number of invoices they have submitted.

SELECT 
    s.supplier_name,
    COUNT(i.invoice_id) AS invoice_count,
    SUM(i.invoice_amount) AS total_invoice_amount
FROM 
    suppliers s
JOIN 
    invoices i ON s.supplier_id = i.supplier_id
GROUP BY 
    s.supplier_name
ORDER BY 
    invoice_count DESC;
