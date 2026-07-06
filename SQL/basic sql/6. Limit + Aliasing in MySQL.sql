-- Limit & Aliasing

SELECT *
FROM employee_demographics
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1;-- start at position 2 and choose one after it

-- Aliasing
SELECT gender, AVG(age) as avg_age -- as can be added or not like the demonstration
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
-- or
SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
