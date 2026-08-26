```sql
WITH newTable AS (
  SELECT o.customer_id as customer_id, c.name as name, p.price as price, o.quantity as quantity, o.order_date as order_date
  FROM Orders o 
  LEFT JOIN Customers c ON o.customer_id = c.customer_id
  LEFT JOIN Product p ON p.product_id = o.product_id
  WHERE MONTH(order_date) IN (6,7) AND YEAR(order_date) = 2020
)
SELECT customer_id, name
FROM newTable
GROUP BY customer_id
HAVING SUM(CASE WHEN MONTH(order_date) = 06 THEN price*quantity ELSE 0 END) >= 100 AND
SUM(CASE WHEN MONTH(order_date) = 07 THEN price*quantity ELSE 0 END) >= 100;
```
