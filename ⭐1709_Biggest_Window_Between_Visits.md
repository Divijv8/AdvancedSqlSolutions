```sql
WITH newTable AS (
    SELECT
        user_id,
        visit_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY visit_date
        ) AS rnk
    FROM UserVisits
)
SELECT
    t1.user_id,
    MAX(
        CASE
            WHEN t2.user_id IS NULL
                THEN DATEDIFF('2021-01-01', t1.visit_date)
            ELSE DATEDIFF(t2.visit_date, t1.visit_date)
        END
    ) AS biggest_window
FROM newTable t1
LEFT JOIN newTable t2
    ON t1.rnk + 1 = t2.rnk
   AND t1.user_id = t2.user_id
GROUP BY t1.user_id;

```
