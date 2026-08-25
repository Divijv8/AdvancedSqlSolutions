**⭐SQL Execution order⭐**
```markdown
FROM
→ Choose the tables.

JOIN / ON
→ Combine rows from multiple tables based on the join condition.

WHERE
→ Filter individual rows.

GROUP BY
→ Group the remaining rows.

HAVING
→ Filter groups after aggregation.

SELECT
→ Choose the columns/expressions to return.

DISTINCT
→ Remove duplicate result rows.

ORDER BY
→ Sort the final result.

LIMIT / OFFSET
→ Restrict how many rows are returned and where to start.
```
**CODE: **
```sql
SELECT s.student_id as student_id, s.student_name as name
FROM Exam e
LEFT JOIN Student s
ON e.student_id = s.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.exam_id) > 0 AND
SUM ( e.score = (
  SELECT MIN(e1.score)
  FROM Exam e1
  WHERE e1.exam_id = e.exam_id
) OR e.score = (
  SELECT MAX(e2.score)
  FROM Exam e2
  WHERE e2.exam_id = e.exam_id
)) = 0
ORDER BY s.student_id;
```
