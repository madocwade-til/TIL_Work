# Write your MySQL query statement below

with feb_orders
as (
    SELECT * FROM Orders 
    WHERE (order_date BETWEEN '2020-02-01' AND '2020-02-29')
)


SELECT p.product_name as product_name, SUM(o.unit) as unit
FROM feb_orders o JOIN Products p ON p.product_id = o.product_id
GROUP BY product_name
HAVING unit >= 100