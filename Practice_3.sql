-- Exercise1
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID
-- Exercise2
SELECT user_id,
CONCAT(UPPER(LEFT(name,1)),LOWER(RIGHT(name,Length(name)-1 )))
AS name
FROM Users
-- Exercise6
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15 
-- Exercise7
SELECT activity_date as day,
COUNT( DISTINCT user_id) as active_users
FROM Activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
ORDER BY activity_date
-- Exercise3
SELECT manufacturer,
CONCAT( '$', CEILING(SUM (total_sales)/1000000), ' ', 'million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sale DESC, manufacturer 
-- Exercise4
SELECT EXTRACT(month FROM submit_date) AS mth,
product_id AS product, 
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY product_id, EXTRACT(month FROM submit_date)
ORDER BY mth, product 
-- Exercise5
SELECT sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(month FROM sent_date) = 8 AND EXTRACT(year FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
-- Exercise8
SELECT EXTRACT(month from joining_date) AS month,
COUNT(id) AS total_hired_employees
FROM employees
WHERE EXTRACT(month from joining_date) BETWEEN 1 AND 7
GROUP BY EXTRACT(month from joining_date)
-- Exercise9
-- Exercise10
