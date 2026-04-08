-- Query: Spend by Supplier
-- Description: Total spend by supplier based on approved or paid invoices.

SELECT 
    s.supplier_name,
    SUM(i.invoice_amount) AS total_spend,
    COUNT(i.invoice_id) AS invoice_count
FROM 
    suppliers s
JOIN 
    invoices i ON s.supplier_id = i.supplier_id
WHERE 
    i.status IN ('APPROVED', 'PAID')
GROUP BY 
    s.supplier_name
ORDER BY 
    total_spend DESC;
