```sql
WITH newTable AS (
  SELECT p.id as id, p.phone_number as phone_number, c.duration as len
  FROM Person p 
  LEFT JOIN Calls c 
  ON c.caller_id = p.id 
  
  UNION ALL 

  SELECT p.id as id, p.phone_number as phone_number, c.duration as len
  FROM Person p 
  LEFT JOIN Calls c 
  ON c.callee_id = p.id 
)
SELECT c.name as country 
FROM newTable t 
LEFT JOIN Country c
ON REGEXP_SUBSTR(t.phone_number, '^[0-9]{3}') = c.country_code
GROUP BY c.name 
HAVING AVG(len) > (
  SELECT AVG(len)
  FROM newTable
);
```
