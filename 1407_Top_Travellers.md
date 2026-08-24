```sql
SELECT u.name as name, COALESCE(SUM(r.distance), 0) AS travel_distance
FROM Users u
LEFT JOIN Rides r
ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travel_distance Desc,name;
```
