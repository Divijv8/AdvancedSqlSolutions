```sql
SELECT s.id as Id, s.name as Name
FROM Students s
LEFT JOIN Departments d
ON d.id = s.department_id
WHERE d.id IS NULL;
```
