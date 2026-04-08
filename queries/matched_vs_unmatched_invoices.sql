-- Query: Matched vs Unmatched Invoices
-- Description: Summary of invoices that are matched to Purchase Orders vs those that are not.

SELECT 
    CASE 
        WHEN il.po_line_id IS NOT NULL THEN 'MATCHED'
        ELSE 'UNMATCHED'
    END AS match_status,
    COUNT(DISTINCT i.invoice_id) AS invoice_count,
    SUM(il.line_amount) AS total_amount
FROM 
    invoices i
JOIN 
    invoice_lines il ON i.invoice_id = il.invoice_id
GROUP BY 
    CASE 
        WHEN il.po_line_id IS NOT NULL THEN 'MATCHED'
        ELSE 'UNMATCHED'
    END;
