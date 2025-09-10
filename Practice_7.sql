--Exercise1
WITH year_spend AS (
SELECT product_id, 
EXTRACT(YEAR FROM transaction_date) AS year,
SUM(spend) AS total_spend
FROM user_transactions
GROUP BY product_id, EXTRACT(YEAR FROM transaction_date)),
spend_with_prev AS(
SELECT product_id, year, total_spend AS curr_year_spend,
LAG(total_spend) OVER (PARTITION BY product_id ORDER BY year) AS prev_year_spend
FROM year_spend)
SELECT year, product_id, curr_year_spend, prev_year_spend,
ROUND (
CASE WHEN prev_year_spend = 0 OR prev_year_spend IS NULL
THEN NULL
ELSE ((curr_year_spend - prev_year_spend)/prev_year_spend) *100
END, 2)
AS yoy_rate
FROM spend_with_prev 
ORDER BY product_id, year
--Exercise2
WITH ranked_cards AS (
SELECT card_name, issue_year, issue_month, issued_amount,
ROW_NUMBER() OVER (PARTITION BY card_name ORDER BY issue_year ASC, issue_month ASC
) AS t FROM monthly_cards_issued)
SELECT card_name, issued_amount
FROM ranked_cards
WHERE t = 1
ORDER BY issued_amount DESC;
--Exercise3
WITH a AS (
SELECT user_id, spend, transaction_date,
ROW_NUMBER () OVER (PARTITION BY user_id ORDER BY transaction_date
ASC) AS t 
FROM transactions)
SELECT user_id, spend, transaction_date
FROM a WHERE t = 3
--Exercise4
WITH a AS (
SELECT user_id, transaction_date,
COUNT(product_id) AS purchase_count,
ROW_NUMBER () OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS t
FROM user_transactions
GROUP BY user_id, transaction_date
ORDER BY transaction_date )
SELECT transaction_date, user_id, purchase_count
FROM a 
WHERE t = 1 
--Exercise5
SELECT user_id, tweet_date,
ROUND (AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2)
AS rolling_avg_3d
FROM tweets
--Exercise6
--Exercise7
SELECT category, product, total_spend FROM (
SELECT category, product, SUM(spend) AS total_spend,
RANK() OVER (PARTITION BY category 
ORDER BY SUM(spend) DESC) AS ranking
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product) AS ranked_spending 
WHERE ranking <=2
ORDER BY category, ranking
--Exercise8

