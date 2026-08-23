```sql
SELECT e.employee_id as employee_id, COUNT(e.team_id) AS team_size
FROM Employee e
JOIN Employee e1
ON e.team_id = e1.team_id
GROUP BY e.employee_id;
```
