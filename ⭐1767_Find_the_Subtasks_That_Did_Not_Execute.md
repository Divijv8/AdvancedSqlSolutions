```sql
Find the Subtasks That Did Not Execute
WITH RECURSIVE newTable AS (

    SELECT 
        task_id,
        1 AS task_num,
        subtasks_count
    FROM Tasks

    UNION ALL

    SELECT 
        task_id,
        task_num + 1,
        subtasks_count
    FROM newTable
    WHERE task_num < subtasks_count

)
SELECT n.task_id, n.task_num as subtask_id
FROM newTable n 
LEFT JOIN Executed e 
ON e.task_id = n.task_id AND n.task_num = e.subtask_id
WHERE e.task_id IS NULL
ORDER BY n.task_id;
```

**Recursive with Joins (not efficient)**
```sql
WITH RECURSIVE newTable AS (

    SELECT 
        task_id,
        1 AS task_num
    FROM Tasks

    UNION ALL

    SELECT 
        n.task_id,
        n.task_num + 1
    FROM newTable n
    LEFT JOIN Tasks t 
    ON t.task_id = n.task_id
    WHERE n.task_num < t.subtasks_count
)
SELECT n.task_id, n.task_num as subtask_id
FROM newTable n 
LEFT JOIN Executed e 
ON e.task_id = n.task_id AND n.task_num = e.subtask_id
WHERE e.task_id IS NULL
ORDER BY n.task_id;
```
