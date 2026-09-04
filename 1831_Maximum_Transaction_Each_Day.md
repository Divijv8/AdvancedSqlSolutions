```sql
WITH newTable AS (
    SELECT transaction_id, DENSE_RANK() OVER (PARTITION BY DATE(day) ORDER BY amount DESC) as rnk 
    FROM Transactions
)
SELECT transaction_id
FROM newTable
WHERE rnk <= 1
ORDER BY transaction_id;
```
