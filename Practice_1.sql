-- Exercise1
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA'
AND POPULATION > 120000
-- Exercise2
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN'
-- Exercise3
SELECT CITY, STATE FROM STATION
-- Exercise4
SELECT DISTINCT CITY FROM STATION 
WHERE CITY LIKE 'a%'
OR CITY LIKE 'e%'
OR CITY LIKE 'i%'
OR CITY LIKE 'o%'
OR CITY LIKE 'u%'
-- Exercise5
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%a'
OR CITY LIKE '%e'
OR CITY LIKE '%i'
OR CITY LIKE '%o'
OR CITY LIKE '%u'
-- Exercise6
SELECT DISTINCT CITY FROM STATION
WHERE NOT (CITY LIKE 'a%'
OR CITY LIKE 'e%'
OR CITY LIKE 'i%'
OR CITY LIKE 'o%'
OR CITY LIKE 'u%')
-- Exercise7
SELECT name FROM Employee
ORDER BY name
-- Exercise8
SELECT name FROM Employee
WHERE salary >2000 
AND months <10
ORDER BY employee_id 
-- Exercise9
SELECT product_id FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y'
-- Exercise10
SELECT name FROM Customer
WHERE referee_id !=2
OR referee_id is NULL
-- Exercise11
SELECT name, area, population FROM WORLD
WHERE area >= 3000000
OR population >= 25000000
-- Exercise12
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id = viewer_id
ORDER BY id
-- Exercise13
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date is NULL
-- Exercise14
select * from lyft_drivers
where yearly_salary <= 30000
or yearly_salary >= 70000
-- Exercise15
select * from uber_advertising;
select advertising_channel from uber_advertising
where money_spent> 1000000
and year =2019

