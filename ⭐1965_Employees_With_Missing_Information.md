**Full Outer Join**
```sql
WITH table1 AS (
  SELECT
    e.employee_id,
    e.name,
    s.salary
  FROM Employees e
  LEFT JOIN Salaries s
    ON e.employee_id = s.employee_id
    WHERE s.employee_id IS NULL

  UNION 

  SELECT
    s.employee_id,
    e.name,
    s.salary
  FROM Salaries s
  LEFT JOIN Employees e
    ON e.employee_id = s.employee_id
  WHERE e.employee_id IS NULL
)
SELECT employee_id
FROM table1
ORDER BY employee_id;
```
