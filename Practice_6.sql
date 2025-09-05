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


