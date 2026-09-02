```sql
WITH newTable AS (
  SELECT emp_id, event_day, (out_time-in_time) AS time_spent
  FROM Employees
)
SELECT event_day as day, emp_id, SUM(time_spent) AS total_time
FROM newTable
GROUP BY event_day, emp_id;
```
