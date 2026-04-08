-- Query: Top Buyers by Spend
-- Description: Buyers with the highest total Purchase Order amount.

SELECT 
    po.buyer_id,
    SUM(pol.quantity * pol.unit_price) AS total_po_amount,
    COUNT(DISTINCT po.po_header_id) AS po_count
FROM 
    purchase_orders po
JOIN 
    purchase_order_lines pol ON po.po_header_id = pol.po_header_id
GROUP BY 
    po.buyer_id
ORDER BY 
    total_po_amount DESC;
