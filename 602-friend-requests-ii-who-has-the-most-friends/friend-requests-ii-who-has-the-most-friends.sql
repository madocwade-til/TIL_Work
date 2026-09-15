# Write your MySQL query statement below

with f1 as (

SELECT 
requester_id as id,
accepter_id as friend

FROM RequestAccepted

),

f2 as
(
    SELECT 
accepter_id as id,
requester_id as friend

FROM RequestAccepted

)

SELECT 
id, 
COUNT(DISTINCT friend) as num
FROM (SELECT * FROM f1 UNION ALL SELECT * FROM f2) as combined
GROUP BY id
ORDER BY num desc LIMIT 1