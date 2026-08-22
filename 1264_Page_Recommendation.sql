WITH newTable AS (
  SELECT  l.page_id AS pages
  FROM Likes l
  JOIN Friendship f
  ON l.user_id = f.user1_id
  WHERE f.user2_id = 1

  UNION ALL

  SELECT l.page_id AS pages
  FROM Friendship f
  JOIN Likes l
  ON l.user_id = f.user2_id
  WHERE f.user1_id = 1
)
SELECT DISTINCT pages as recommended_page 
FROM newTable
WHERE pages NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1
);
