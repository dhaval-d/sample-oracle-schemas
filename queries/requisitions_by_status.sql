-- Query: Requisitions by Status
-- Description: Count of purchase requisitions grouped by their status.

SELECT 
    status,
    COUNT(requisition_header_id) AS requisition_count
FROM 
    purchase_requisitions
GROUP BY 
    status
ORDER BY 
    requisition_count DESC;
