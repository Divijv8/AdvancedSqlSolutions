```sql
WITH newTable AS (
  SELECT event_type, AVG(occurences) as avgOccur
  FROM Events
  GROUP BY event_type
)
SELECT e.business_id
FROM Events e
JOIN newTable t 
ON t.event_type = e.event_type AND e.occurences > t.avgOccur
GROUP BY e.business_id
HAVING COUNT(*) > 1;
```
