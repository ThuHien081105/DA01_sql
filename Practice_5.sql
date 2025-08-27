--Exercise1
SELECT a.CONTINENT AS COUNTRY_Continent, FLOOR(AVG(b.POPULATION)) AS City_population FROM COUNTRY AS a
INNER JOIN CITY AS b
ON a.CODE = b.COUNTRYCODE
GROUP BY a.CONTINENT
--Exercise2
SELECT ROUND(COUNT(texts.email_id)::DECIMAL
/COUNT(DISTINCT emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed'
--Exercise3
WITH supercloud AS
(SELECT customers.customer_id,
COUNT(DISTINCT products.product_category) AS product_count
FROM customer_contracts AS customers 
JOIN products
ON customers.product_id = products.product_id
GROUP BY customer_id)
SELECT customer_id FROM supercloud 
WHERE product_count = (SELECT COUNT(DISTINCT product_category) FROM products)
--Exercise4
WITH supercloud AS
(SELECT customers.customer_id,
COUNT(DISTINCT products.product_category) AS product_count
FROM customer_contracts AS customers 
JOIN products
ON customers.product_id = products.product_id
GROUP BY customer_id)
SELECT customer_id FROM supercloud 
WHERE product_count = (SELECT COUNT(DISTINCT product_category) FROM products)
--Exercise5
SELECT 
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM employees e
JOIN employees m
    ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;
--Exercise6
SELECT 
    p.product_name,
    SUM(a.unit) AS unit
FROM Products p
JOIN Orders a
    ON p.product_id = a.product_id
WHERE a.order_date >= '2020-02-01'
  AND a.order_date < '2020-03-01'
GROUP BY p.product_id, p.product_name
HAVING SUM(a.unit) >= 100;
--Exercise7 (bị lỗi) 

