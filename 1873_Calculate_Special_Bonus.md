**Without REGEXP**
```sql
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 0 THEN 0
        WHEN name REGEXP '^M' THEN 0
        ELSE salary
    END AS bonus
FROM Employees
ORDER BY employee_id;
```

**With REGEXP**
```sql
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 0 THEN 0
        WHEN name REGEXP '^M' THEN 0
        ELSE salary
    END AS bonus
FROM Employees
ORDER BY employee_id;
```
