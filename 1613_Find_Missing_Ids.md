```sql
WITH RECURSIVE ids AS(
  SELECT 1 as customer_id

  UNION ALL

  SELECT customer_id+1
  FROM ids
  WHERE customer_id < (SELECT MAX(customer_id) FROM Customers)
)
SELECT i.customer_id
FROM ids i
LEFT JOIN Customers c 
ON c.customer_id = i.customer_id
WHERE c.customer_id IS NULL; 
```
