-- Having vs Where
-- in short, WHERE filters the raw data, while HAVING filters the aggregated results.

SELECT gender, AVG(age) 
FROM employee_demographics 
GROUP BY gender 
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;