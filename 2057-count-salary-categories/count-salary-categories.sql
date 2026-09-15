# Write your MySQL query statement below
WITH ls as
(
    SELECT 'Low Salary' as category, 
    COUNT(DISTINCT account_id) as accounts_count
    FROM Accounts
    WHERE income < 20000
),

ms as
(
    SELECT 'Average Salary' as category, 
    COUNT(DISTINCT account_id) as accounts_count
    FROM Accounts
    WHERE income >= 20000 AND income <= 50000
),

hs as
(
    SELECT 'High Salary' as category, 
    COUNT(DISTINCT account_id) as accounts_count
    FROM Accounts
    WHERE income > 50000
)



SELECT *
FROM ls 
UNION ALL
SELECT *
FROM ms 
UNION ALL
SELECT *
FROM hs


