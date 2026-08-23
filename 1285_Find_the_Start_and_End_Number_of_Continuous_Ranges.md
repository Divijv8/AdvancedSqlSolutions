***Classic gaps and Island technique***

```sql
WITH Ranked AS (
  SELECT log_id, (log_id-ROW_NUMBER() OVER (ORDER BY log_id)) as check_rank
  FROM Logs
)
SELECT MIN(log_id) as start_id, MAX(log_id) as end_id
FROM Ranked
GROUP BY check_rank;

```

