/*without Coleasce:*/
WITH Results AS (
  SELECT host_team as team_id,
  CASE WHEN host_goals > guest_goals THEN 3
  WHEN host_goals = guest_goals THEN 1
  ELSE 0
  END AS points
  FROM Matches
  
  UNION ALL

  SELECT guest_team as team_id,
  CASE WHEN guest_goals > host_goals THEN 3
  WHEN host_goals = guest_goals THEN 1
  ELSE 0
  END AS points
  FROM Matches
)
SELECT t.team_id as team_id, t.team_name as name, 
CASE WHEN r.points is NULL THEN 0
ELSE SUM(r.points)
end as points
FROM Teams t
LEFT JOIN Results r 
ON t.team_id = r.team_id
GROUP BY t.team_id
ORDER BY points DESC, t.team_id;

/*Using Coleasce:*/
WITH Results AS (
    SELECT 
        host_team AS team_id,
        CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS points
    FROM Matches

    UNION ALL

    SELECT 
        guest_team AS team_id,
        CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END AS points
    FROM Matches
)

SELECT 
    t.team_id,
    t.team_name AS name,
    COALESCE(SUM(r.points), 0) AS points
FROM Teams t
LEFT JOIN Results r
    ON t.team_id = r.team_id
GROUP BY t.team_id, t.team_name
ORDER BY points DESC, t.team_id;
