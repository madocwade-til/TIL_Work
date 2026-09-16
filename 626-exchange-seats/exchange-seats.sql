with max as 
(SELECT Max(id)
FROM Seat)


SELECT 
    id,
    (CASE 
        WHEN id = (SELECT * from max) AND id % 2 = 1 THEN student
        WHEN id % 2 = 1 THEN LEAD(student, 1) OVER ()
        WHEN id % 2 = 0 THEN LAG(student, 1) OVER ()
    END) as student

FROM Seat
