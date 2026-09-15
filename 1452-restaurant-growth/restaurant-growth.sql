# Write your MySQL query statement below
WITH daily_sums
AS
(
    SELECT
    visited_on,
    SUM(amount) as daily_amount
    FROM Customer
    GROUP BY visited_on
),

rolling
AS
(
    SELECT 
    ROW_NUMBER() OVER (ORDER BY visited_on asc) as rn,

    visited_on, 

    SUM(daily_amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) as amount, 

    ROUND(
        AVG(daily_amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) as average_amount

    FROM daily_sums
)

SELECT visited_on, amount, average_amount
FROM rolling
WHERE rn >= 7
ORDER BY visited_on

