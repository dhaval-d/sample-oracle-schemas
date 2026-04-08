-- Query: PO Lines Summary
-- Description: Summary of purchase order lines by item description.

SELECT 
    item_description,
    SUM(quantity) AS total_quantity,
    AVG(unit_price) AS avg_unit_price,
    SUM(quantity * unit_price) AS total_amount
FROM 
    purchase_order_lines
GROUP BY 
    item_description
ORDER BY 
    total_amount DESC;
