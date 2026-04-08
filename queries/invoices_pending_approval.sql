-- Query: Invoices Pending Approval
-- Description: List invoices that have not been approved yet.

SELECT 
    i.invoice_num,
    s.supplier_name,
    i.invoice_date,
    i.invoice_amount,
    i.invoice_currency
FROM 
    invoices i
JOIN 
    suppliers s ON i.supplier_id = s.supplier_id
WHERE 
    i.status = 'NEVER APPROVED'
ORDER BY 
    i.invoice_date ASC;
