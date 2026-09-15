# Write your MySQL query statement below
with cte as
(
    SELECT 
    u.user_id as user_id,
    r.movie_id as movie_id,
    u.name as name,
    m.title as title,
    r.rating as rating,
    r.created_at as review_date

    FROM MovieRating r JOIN Users u ON r.user_id = u.user_id JOIN Movies m ON r.movie_id = m.movie_id
),

top_reviewer as
(
SELECT 
COUNT(DISTINCT title) as reviews, 
user_id, 
name 
FROM cte
GROUP BY user_id
ORDER BY reviews desc, name asc LIMIT 1
),

top_feb_movie as
(
    SELECT AVG(rating) as average_score, title
    FROM cte
    WHERE review_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY title
    ORDER BY average_score desc, title asc LIMIT 1
    
)

SELECT name as results from top_reviewer UNION ALL SELECT title as results FROM top_feb_movie