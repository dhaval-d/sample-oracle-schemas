-- Query: Receipts by Date
-- Description: Summary of goods receipts within a specific period.

SELECT 
    rh.receipt_num,
    rh.receipt_date,
    s.supplier_name,
    COUNT(rl.shipment_line_id) AS line_count
FROM 
    receiving_headers rh
JOIN 
    suppliers s ON rh.supplier_id = s.supplier_id
JOIN 
    receiving_lines rl ON rh.shipment_header_id = rl.shipment_header_id
GROUP BY 
    rh.receipt_num, rh.receipt_date, s.supplier_name
ORDER BY 
    rh.receipt_date DESC;
