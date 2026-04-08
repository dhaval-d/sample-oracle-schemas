-- Query: Unpaid Invoices
-- Description: List invoices that have not been paid yet.

SELECT 
    i.invoice_num,
    s.supplier_name,
    i.invoice_date,
    i.invoice_amount,
    i.status
FROM 
    invoices i
JOIN 
    suppliers s ON i.supplier_id = s.supplier_id
WHERE 
    i.status NOT IN ('PAID', 'CANCELLED')
ORDER BY 
    i.invoice_date ASC;
