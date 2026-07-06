-- Unions

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION -- Explicitly it was UNION DISTINCT, only unique value
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL -- show all rows from both table
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old Man' As Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' As Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' As Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;