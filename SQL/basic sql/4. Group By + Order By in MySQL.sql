-- Group By

SELECT * FROM employee_demographics;

SELECT gender FROM employee_demographics GROUP BY gender; -- same as SELECT DISTINCT
SELECT DISTINCT gender FROM employee_demographics;
-- select column need to be same value with group by column
-- doing with aggregate function
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;

SELECT gender, AVG(age), MIN(age), MAX(age), COUNT(age) FROM employee_demographics GROUP BY gender;

-- just demonstrating unique things
SELECT occupation FROM employee_salary GROUP BY occupation;
SELECT occupation, salary FROM employee_salary GROUP BY occupation, salary;

-- ORDER BY (asc or desc)
SELECT * FROM employee_demographics ORDER BY first_name; -- by default is asc
SELECT * FROM employee_demographics ORDER BY first_name DESC;

SELECT * FROM employee_demographics ORDER BY gender;
SELECT * FROM employee_demographics ORDER BY gender, age;
SELECT * FROM employee_demographics ORDER BY gender, age DESC;

SELECT * FROM employee_demographics ORDER BY age, gender; -- this query is useless cause age has many unique value than gender that has 2 value
SELECT * FROM employee_demographics ORDER BY 5, 4; -- use for shorthand, 5 as gender and 4 as age, still use column name for best practice

