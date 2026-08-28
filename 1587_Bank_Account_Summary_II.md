```sql
SELECT u.name as name, SUM(t.amount) as balance
FROM Transactions t
INNER JOIN Users u 
ON t.account = u.account
GROUP BY u.account, u.name
HAVING SUM(t.amount) > 10000;
```
