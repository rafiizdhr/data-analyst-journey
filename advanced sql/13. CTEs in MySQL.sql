-- CTEs (Common Table Expression)

WITH CTE_Example AS
(
	SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary), SUM(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * 
FROM CTE_Example;

SELECT * -- this wont work bcs, after stated cte, it has to used quickly after
FROM CTE_Example;

WITH CTE_Example AS
(
	SELECT GENDER, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
    FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
    GROUP BY gender    
) -- after group by in subquery, we can do aggregate again with group by outer the subquery.
SELECT gender, ROUND(AVG(`SUM(salary)`/`COUNT(salary)`), 2)
FROM CTE_Example
GROUP BY gender
;

-- rename column in subquery in cte table name
WITH CTE_Example (gender, sum_salary, min_salary, max_salary, count_salary) AS
(
	SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
    FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT gender, ROUND(AVG(`sum_salary`/`count_salary`),2)
FROM CTE_Example
GROUP BY gender;
-- different in above and below, its just use of a back tick. and it works for both. i dunno why
WITH CTE_Example (gender, sum_salary, min_salary, max_salary, count_salary) AS
(
	SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
    FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT gender, ROUND(AVG(sum_salary/count_salary),2)
FROM CTE_Example
GROUP BY gender;


-- example of using 2 cte and use both cte with join 
WITH CTE_Example AS
(
	SELECT employee_id, gender, birth_date
    FROM employee_demographics dem
    WHERE birth_date > '1985-01-01'
), 
CTE_Example2 AS
(
	SELECT employee_id, salary
    FROM employee_salary
    WHERE salary >= 50000
)
SELECT *
FROM CTE_Example cte1
JOIN CTE_Example2 cte2
	ON cte1.employee_id = cte2.employee_id
;



