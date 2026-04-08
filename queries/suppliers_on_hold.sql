-- Query: Suppliers on Hold
-- Description: List of suppliers that are currently on hold.

SELECT 
    supplier_name,
    supplier_number,
    tax_payer_id
FROM 
    suppliers
WHERE 
    supplier_status = 'ON_HOLD'
ORDER BY 
    supplier_name ASC;
