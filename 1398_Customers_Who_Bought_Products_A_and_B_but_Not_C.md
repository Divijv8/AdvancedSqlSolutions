```sql
SELECT c.customer_id as customer_id, c.customer_name as customer_name
FROM Orders o
LEFT JOIN Customers c
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING
  SUM(CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END) 
    AND
  SUM(CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END) 
    AND
  SUM(CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END) = 0;
```
