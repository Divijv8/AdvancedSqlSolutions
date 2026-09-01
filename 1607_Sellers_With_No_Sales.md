```sql
WITH newTable AS (
    SELECT * 
    FROM Orders
    WHERE YEAR(sale_date) = 2020
)
SELECT s.seller_name as seller_name
FROM Seller s 
LEFT JOIN newTable t 
ON t.seller_id = s.seller_id
WHERE t.order_id IS NULL;
```
