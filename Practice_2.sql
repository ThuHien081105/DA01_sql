-- Exercise 1
SELECT DISTINCT CITY FROM STATION
WHERE ID%2=0
-- Exercise2
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
AS difference
FROM STATION
-- Exercise4
SELECT 
ROUND(CAST(SUM(item_count*order_occurences)/SUM(order_occurences) AS DECIMAL),1) 
AS MEAN
-- Exercise5
SELECT candidate_id
FROM candidates
WHERE skill IN('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3 
ORDER BY candidate_id 
-- Exercise6
SELECT user_id, 
DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between
FROM posts
WHERE post_date >= '2021-01-01' AND post_date < '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id) >=2
-- Exercise7
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC
-- Exercise8
SELECT manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
-- Exercise9
SELECT id, movie, description, rating
FROM Cinema
WHERE id %2<>0 AND description <> 'boring'
ORDER BY rating DESC
-- Exercise10
SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
ORDER BY teacher_id
-- Exercise11
SELECT user_id,
COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id 
-- Exercise12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >=5 



