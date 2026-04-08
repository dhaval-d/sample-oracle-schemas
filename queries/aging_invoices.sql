-- Query: Aging Invoices
-- Description: Unpaid invoices grouped by aging buckets based on invoice date.

SELECT 
    s.supplier_name,
    i.invoice_num,
    i.invoice_date,
    i.invoice_amount,
    CASE 
        WHEN (SYSDATE - i.invoice_date) <= 30 THEN '0-30 Days'
        WHEN (SYSDATE - i.invoice_date) <= 60 THEN '31-60 Days'
        WHEN (SYSDATE - i.invoice_date) <= 90 THEN '61-90 Days'
        ELSE 'Over 90 Days'
    END AS aging_bucket
FROM 
    invoices i
JOIN 
    suppliers s ON i.supplier_id = s.supplier_id
WHERE 
    i.status != 'PAID'
ORDER BY 
    i.invoice_date ASC;
