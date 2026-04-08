-- Query: Payments in Date Range
-- Description: List payments made within a specific date range (example uses year 2026).

SELECT 
    p.payment_id,
    p.payment_date,
    p.payment_amount,
    p.payment_method,
    i.invoice_num,
    s.supplier_name
FROM 
    payments p
JOIN 
    invoices i ON p.invoice_id = i.invoice_id
JOIN 
    suppliers s ON i.supplier_id = s.supplier_id
WHERE 
    p.payment_date BETWEEN TO_DATE('2026-01-01', 'YYYY-MM-DD') AND TO_DATE('2026-12-31', 'YYYY-MM-DD')
ORDER BY 
    p.payment_date DESC;
