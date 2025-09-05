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


