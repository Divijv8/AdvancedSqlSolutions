**With CTE**
*Complexity : O(3n)*
```sql
WITH Store1 AS (
  SELECT product_id, 'store1' as store, store1 as price
  FROM Products 
),
Store2 AS (
  SELECT product_id, 'store2' as store, store2 as price
  FROM Products 
),
Store3 AS (
  SELECT product_id, 'store3' as store, store3 as price
  FROM Products 
)
SELECT *
FROM Store1
WHERE price IS NOT NULL

UNION ALL

SELECT * 
FROM Store2
WHERE price IS NOT NULL

UNION ALL

SELECT *
FROM Store3
WHERE price IS NOT NULL

ORDER BY product_id;
```

**Without CTE**
```sql
SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL

ORDER BY product_id;
```
