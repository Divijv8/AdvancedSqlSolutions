**Worst Solution Don't take it as reference if anyone seeing**
```sql
WITH Nadal AS (
    SELECT 1 AS player_id, 'Wimbledon' AS tour
    FROM Championships
    WHERE Wimbledon = 1

    UNION ALL

    SELECT 1, 'Fr_open'
    FROM Championships
    WHERE Fr_open = 1

    UNION ALL

    SELECT 1, 'US_open'
    FROM Championships
    WHERE US_open = 1

    UNION ALL

    SELECT 1, 'Au_open'
    FROM Championships
    WHERE Au_open = 1
),
Federer AS (
    SELECT 2 AS player_id, 'Wimbledon' AS tour
    FROM Championships
    WHERE Wimbledon = 2

    UNION ALL

    SELECT 2, 'Fr_open'
    FROM Championships
    WHERE Fr_open = 2

    UNION ALL

    SELECT 2, 'US_open'
    FROM Championships
    WHERE US_open = 2

    UNION ALL

    SELECT 2, 'Au_open'
    FROM Championships
    WHERE Au_open = 2
),
Novak AS (
    SELECT 3 AS player_id, 'Wimbledon' AS tour
    FROM Championships
    WHERE Wimbledon = 3

    UNION ALL

    SELECT 3, 'Fr_open'
    FROM Championships
    WHERE Fr_open = 3

    UNION ALL

    SELECT 3, 'US_open'
    FROM Championships
    WHERE US_open = 3

    UNION ALL

    SELECT 3, 'Au_open'
    FROM Championships
    WHERE Au_open = 3
)
SELECT all_players.player_id as player_id, p.player_name as player_name, COUNT(*) as grand_slams_count
FROM (
    SELECT * FROM Nadal
    UNION ALL
    SELECT * FROM Federer
    UNION ALL
    SELECT * FROM Novak
) AS all_players
LEFT JOIN Players p 
ON p.player_id = all_players.player_id
GROUP BY player_id;
```

**Good Solution:**
```sql
WITH newTable AS (
    SELECT Wimbledon AS player_id FROM Championships
    UNION ALL
    SELECT Fr_open AS player_id FROM Championships
    UNION ALL
    SELECT US_open AS player_id FROM Championships
    UNION ALL 
    SELECT Au_open AS player_id FROM Championships
)
SELECT p.player_id as player_id, p.player_name as player_name, COUNT(*) AS grand_slam_counts
FROM newTable t 
LEFT JOIN Players p 
ON p.player_id = t.player_id
GROUP BY p.player_id;
```
