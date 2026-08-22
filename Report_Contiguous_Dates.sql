WITH Data AS (
    SELECT fail_date AS date, 'failed' AS state
    FROM Failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'

    UNION ALL

    SELECT success_date AS date, 'succeeded' AS state
    FROM Succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
), 
res_Data AS (
    SELECT *,
           DATE(
               date,
               '-' || ROW_NUMBER() OVER (
                   PARTITION BY state
                   ORDER BY date
               ) || ' days'
           ) AS res_date
    FROM Data
)

SELECT 
    state AS period_state,
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM res_Data
GROUP BY state, res_date
ORDER BY start_date;
