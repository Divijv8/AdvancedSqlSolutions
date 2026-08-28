```sql
SELECT product_name, product_id, order_id, order_date
FROM (
  SELECT o.product_id as product_id, o.order_id as order_id, o.order_date as order_date, p.product_name,
  DENSE_RANK() OVER (PARTITION BY o.product_id ORDER BY o.order_date DESC) as rnk
  FROM Orders o 
  LEFT JOIN Products p
  ON p.product_id = o.product_id
) n
WHERE rnk <= 1 AND order_date IS NOT NULL
ORDER BY product_name, product_id, order_id;
```
