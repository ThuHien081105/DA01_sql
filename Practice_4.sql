-- Exercise1
SELECT 
SUM(CASE 
WHEN device_type = 'laptop' then 1
ELSE 0
END) AS laptop_reviews,
SUM(CASE 
WHEN device_type IN('tablet', 'phone') then 1
ELSE 0
END) AS mobile_views
FROM viewership 
-- Exercise2
SELECT x,y,z,
CASE
WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
ELSE 'No'
END AS triangle 
FROM Triangle
-- Exercise3
SELECT 
ROUND(100.0 * SUM (CASE WHEN call_category IS NULL OR call_category = 'n/a' then 1 else 0 END)/ COUNT(*),1) 
AS uncategorised_call_pct
FROM callers
-- Exercisse4
--C1:
SELECT name FROM Customer
WHERE referee_id IS null OR referee_id !=2 
--C2:
SELECT name
FROM customer
WHERE CASE 
WHEN referee_id IS NULL OR referee_id != 2 THEN 1
ELSE 0
END = 1
-- Exercise5
SELECT CASE WHEN survived = 1 THEN 1 ELSE 0 END AS survived,
SUM(CASE 
WHEN pclass = 1 THEN 1 ELSE 0 END ) AS first_class,
SUM(CASE
WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class,
SUM(CASE
WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY survived

