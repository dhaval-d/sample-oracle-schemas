-- Query: Open Purchase Orders
-- Description: Purchase orders that are approved and have lines where quantity received is less than quantity ordered.

SELECT 
    po.segment1 AS po_number,
    pol.line_num,
    pol.item_description,
    pol.quantity AS ordered_quantity,
    NVL(SUM(rl.quantity_received), 0) AS received_quantity,
    pol.quantity - NVL(SUM(rl.quantity_received), 0) AS pending_quantity
FROM 
    purchase_orders po
JOIN 
    purchase_order_lines pol ON po.po_header_id = pol.po_header_id
LEFT JOIN 
    receiving_lines rl ON pol.po_line_id = rl.po_line_id
WHERE 
    po.status = 'APPROVED'
GROUP BY 
    po.segment1, pol.line_num, pol.item_description, pol.quantity
HAVING 
    NVL(SUM(rl.quantity_received), 0) < pol.quantity
ORDER BY 
    po.segment1, pol.line_num;
