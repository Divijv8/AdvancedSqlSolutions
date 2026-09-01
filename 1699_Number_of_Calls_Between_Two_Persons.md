```sql
WITH newTable AS (
    SELECT LEAST(from_id, to_id) as person1, GREATEST(from_id, to_id) as person2, duration
    FROM Calls
)
SELECT person1, person2, COUNT(*) as call_count, SUM(duration) as total_duration
FROM newTable
GROUP BY person1, person2;
```
