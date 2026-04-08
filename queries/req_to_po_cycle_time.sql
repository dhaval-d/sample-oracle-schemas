-- Query: Requisition to PO Cycle Time
-- Description: Average time taken from Requisition creation to Purchase Order creation.

SELECT 
    AVG(po.creation_date - pr.creation_date) AS avg_cycle_time_days,
    COUNT(DISTINCT po.po_header_id) AS total_pos_processed
FROM 
    purchase_orders po
JOIN 
    purchase_order_lines pol ON po.po_header_id = pol.po_header_id
JOIN 
    purchase_requisition_lines prl ON pol.requisition_line_id = prl.requisition_line_id
JOIN 
    purchase_requisitions pr ON prl.requisition_header_id = pr.requisition_header_id;
