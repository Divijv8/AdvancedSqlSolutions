```sql
SELECT w.name as warehouse_name, 
SUM(p.Width*p.Height*p.Length*w.units) as volumn
FROM Warehouse w
LEFT JOIN Products p 
ON w.product_id = p.product_id
GROUP BY w.name;
```
