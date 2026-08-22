```sql
SELECT A.employee_id
FROM Employees A 
JOIN Employees B
JOIN Employees C
ON A.manager_id = B.employee_id AND B.manager_id = C.employee_id
WHERE C.manager_id = 1 AND A.employee_id != 1;
```
<br>
<img width="898" height="193" alt="image" src="https://github.com/user-attachments/assets/47ad83c5-4659-47d0-8c40-87bb56ccaf9a" />
