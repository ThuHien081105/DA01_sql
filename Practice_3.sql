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
