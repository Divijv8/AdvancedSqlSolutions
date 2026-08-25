**Creating separate tables (less efficient)**
```sql
WITH Apple AS (
  SELECT sale_date, sold_num
  FROM Sales
  WHERE fruit = 'apples'
),
Orange AS (
  SELECT sale_date, sold_num
  FROM Sales	
  WHERE fruit = 'oranges'
)
SELECT 
    s.sale_date, 
    (
        (SELECT sold_num FROM Apple WHERE sale_date = s.sale_date) - 
        (SELECT sold_num FROM Orange WHERE sale_date = s.sale_date)
    ) AS diff
FROM  Sales s
GROUP BY s.sale_date
ORDER BY sale_date;
```

**Using Conditional Sum**
```sql
SELECT sale_date, 
SUM (CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) as diff
FROM  Sales s
GROUP BY s.sale_date
ORDER BY sale_date;
```
