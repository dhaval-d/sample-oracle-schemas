-- Query: Supplier Site Spend
-- Description: Spend broken down by supplier site for matched invoices.

SELECT 
    s.supplier_name,
    ss.site_name,
    SUM(il.line_amount) AS total_spend,
    COUNT(DISTINCT il.invoice_id) AS invoice_count
FROM 
    suppliers s
JOIN 
    supplier_sites ss ON s.supplier_id = ss.supplier_id
JOIN 
    purchase_orders po ON ss.site_id = po.supplier_site_id
JOIN 
    purchase_order_lines pol ON po.po_header_id = pol.po_header_id
JOIN 
    invoice_lines il ON pol.po_line_id = il.po_line_id
GROUP BY 
    s.supplier_name, ss.site_name
ORDER BY 
    total_spend DESC;
