**With Left Join**
```sql
SELECT customer_name, customer_id, order_id, order_date
FROM (
    SELECT o.order_id as order_id, o.customer_id as customer_id, o.order_date as order_date, c.name as customer_name,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rnk
    FROM Orders o 
    LEFT JOIN Customers c 
    ON c.customer_id = o.customer_id
) n 
WHERE rnk <= 3 AND customer_name IS NOT NULL
ORDER BY customer_name, customer_id, order_date DESC; 
```

**With Inner Join**
```sql
SELECT customer_name, customer_id, order_id, order_date
FROM (
    SELECT o.order_id as order_id, o.customer_id as customer_id, o.order_date as order_date, c.name as customer_name,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rnk
    FROM Orders o 
    INNER JOIN Customers c 
    ON c.customer_id = o.customer_id
) n 
WHERE rnk <= 3 
ORDER BY customer_name, customer_id, order_date DESC; 
```
