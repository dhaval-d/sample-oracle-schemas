-- Query: Invoice Variance
-- Description: Identifies PO lines where the total billed amount differs from the total ordered amount.

SELECT 
    po.segment1 AS po_number,
    pol.line_num,
    pol.item_description,
    pol.quantity * pol.unit_price AS ordered_amount,
    NVL(SUM(il.line_amount), 0) AS billed_amount,
    NVL(SUM(il.line_amount), 0) - (pol.quantity * pol.unit_price) AS variance
FROM 
    purchase_order_lines pol
JOIN 
    purchase_orders po ON pol.po_header_id = po.po_header_id
LEFT JOIN 
    invoice_lines il ON pol.po_line_id = il.po_line_id
GROUP BY 
    po.segment1, pol.line_num, pol.item_description, pol.quantity, pol.unit_price
HAVING 
    NVL(SUM(il.line_amount), 0) != (pol.quantity * pol.unit_price)
ORDER BY 
    variance DESC;
