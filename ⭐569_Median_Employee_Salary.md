```sql
WITH ranked AS(
  SELECT Id, Company, Salary, 
  ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary) as rnk,
  COUNT(*) OVER (PARTITION BY Company) AS total_count
  FROM Employee
)
SELECT Id, Company, Salary
FROM ranked
WHERE rnk <= (total_count + 2) DIV 2 AND (total_count + 1) DIV 2 <= rnk
ORDER BY Company, Salary;
```
