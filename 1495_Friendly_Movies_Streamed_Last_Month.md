**MYSQL**
```sql
SELECT DISTINCT c.title
FROM TVProgram t
LEFT JOIN Content c
    ON c.content_id = t.content_id
WHERE c.kids_content = 'Y'
  AND c.content_type = 'Movies'
  AND YEAR(t.program_date) = 2020
  AND MONTH(t.program_date) = 6;
```
**SQLite**
```sql
SELECT DISTINCT c.title
FROM TVProgram t
LEFT JOIN Content c
    ON c.content_id = t.content_id
WHERE c.kids_content = 'Y'
  AND c.content_type = 'Movies'
  AND strftime('%Y', t.program_date) = '2020'
  AND strftime('%m', t.program_date) = '06';
```
