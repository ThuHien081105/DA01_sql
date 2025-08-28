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
