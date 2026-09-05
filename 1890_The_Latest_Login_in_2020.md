```sql
SELECT user_id, MAX(time_stamp)
FROM Logins
WHERE YEAR(DATE(time_stamp)) = 2020
GROUP BY user_id;
```
