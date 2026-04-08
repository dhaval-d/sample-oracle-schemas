-- Query: Supplier Lead Time
-- Description: Average time (in days) from Purchase Order creation to Goods Receipt.

SELECT 
    s.supplier_name,
    AVG(rh.receipt_date - po.creation_date) AS avg_lead_time_days,
    COUNT(rh.shipment_header_id) AS total_receipts
FROM 
    suppliers s
JOIN 
    purchase_orders po ON s.supplier_id = po.supplier_id
JOIN 
    purchase_order_lines pol ON po.po_header_id = pol.po_header_id
JOIN 
    receiving_lines rl ON pol.po_line_id = rl.po_line_id
JOIN 
    receiving_headers rh ON rl.shipment_header_id = rh.shipment_header_id
GROUP BY 
    s.supplier_name
HAVING 
    COUNT(rh.shipment_header_id) > 0
ORDER BY 
    avg_lead_time_days ASC;
