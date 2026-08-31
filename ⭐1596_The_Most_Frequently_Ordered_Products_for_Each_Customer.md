```sql
WITH RankedProducts AS (
    SELECT 
        customer_id, 
        product_id, 
        COUNT(*) AS frq_products, 
        DENSE_RANK() OVER (
            PARTITION BY customer_id 
            ORDER BY COUNT(*) DESC  
        ) AS rnk
    FROM Orders
    GROUP BY customer_id, product_id
)
SELECT 
    r.customer_id as customer_id, 
    r.product_id as product_id, 
    p.product_name as product_name
FROM RankedProducts r
INNER JOIN Products p
ON p.product_id = r.product_id
WHERE rnk = 1; 
```
