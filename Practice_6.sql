--Exercise1
SELECT COUNT(*)  AS duplicate_companies
FROM (SELECT company_id 
FROM job_listings
GROUP BY company_id, title
HAVING COUNT(*) >1) a
--Exercise2
SELECT category, product, total_spend FROM (
SELECT category, product, SUM(spend) AS total_spend,
RANK() OVER (PARTITION BY category 
ORDER BY SUM(spend) DESC) AS ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product) AS ranked_spending 
WHERE ranking <=2
ORDER BY category, ranking
--Exercise3
SELECT COUNT(*) AS policy_holder_count FROM (
SELECT policy_holder_id FROM callers 
GROUP BY policy_holder_id
HAVING COUNT(policy_holder_id) >=3) a
--Exercise4
SELECT a.page_id FROM pages AS a
LEFT JOIN page_likes AS b
ON a.page_id = b.page_id 
WHERE b.page_id IS NULL
ORDER BY a.page_id
--Exercise5 (Khó quá e chưa hiểu vs chưa làm được ạ)
--Exercise6
SELECT 
DATE_FORMAT(trans_date, '%Y-%m') AS month, country,
COUNT(*) AS trans_count,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY country, DATE_FORMAT(trans_date, '%Y-%m')
ORDER BY month;
--Exercise7
SELECT product_id, first_year, quantity, price
FROM(SELECT product_id, quantity, price, year,
FIRST_VALUE(year) OVER (PARTITION BY product_id ORDER BY year) AS first_year
FROM Sales
) a
WHERE year = first_year;
--Exercise8
SELECT a.customer_id FROM Customer AS a
JOIN Product AS b
ON a.product_key = b.product_key
WHERE b.product_key IN ('5','6')
GROUP BY a.customer_id
HAVING COUNT(DISTINCT b.product_key) = 2;
--Exercise9
SELECT e.employee_id FROM Employees e
WHERE e.salary < 30000
AND e.manager_id IS NOT NULL
AND e.manager_id NOT IN (
SELECT employee_id FROM Employees)
ORDER BY e.employee_id;
--Exercise10
SELECT COUNT(*)  AS duplicate_companies
FROM (SELECT company_id 
FROM job_listings
GROUP BY company_id, title
HAVING COUNT(*) >1) a
--Exercise11
WITH c AS (
SELECT a.name, COUNT(b.movie_id) AS total_ratings FROM Users a
JOIN MovieRating b ON a.user_id = b.user_id 
GROUP BY a.name),
feb_ratings AS (SELECT m.title, AVG(r.rating) AS avg_rating
FROM Movies m
JOIN MovieRating r ON m.movie_id = r.movie_id
WHERE r.created_at >= '2020-02-01'
AND r.created_at < '2020-03-01'
GROUP BY m.title)
(SELECT name  AS results FROM c
ORDER BY total_ratings DESC, name ASC
LIMIT 1) 
UNION ALL
(SELECT title  AS results FROM feb_ratings
ORDER BY avg_rating DESC, title ASC
LIMIT 1)
--Exercise12
SELECT id, COUNT(DISTINCT friend_id) AS num
FROM (SELECT requester_id AS id, accepter_id AS friend_id
FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id, requester_id AS friend_id
FROM RequestAccepted) AS all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;

