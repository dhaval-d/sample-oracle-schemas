-- Query: PO Lines Received vs Billed
-- Description: Compares ordered, received, and billed amounts for PO lines.

SELECT 
    po.segment1 AS po_number,
    pol.line_num,
    pol.item_description,
    pol.quantity * pol.unit_price AS ordered_amount,
    (SELECT NVL(SUM(rl.quantity_received * pol.unit_price), 0) 
     FROM receiving_lines rl 
     WHERE rl.po_line_id = pol.po_line_id) AS received_amount,
    (SELECT NVL(SUM(il.line_amount), 0) 
     FROM invoice_lines il 
     WHERE il.po_line_id = pol.po_line_id) AS billed_amount
FROM 
    purchase_orders po
JOIN 
    purchase_order_lines pol ON po.po_header_id = pol.po_header_id
ORDER BY 
    po.segment1, pol.line_num;
