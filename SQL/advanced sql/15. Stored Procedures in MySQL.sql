-- Stored Procedures

SELECT *
FROM employee_salary
WHERE salary >= 50000;

-- use with stored procedures
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

-- in this case, it'll just make procedure large_salaries2() with just one query and the query below just a random select query. the procedure only having one query
-- which in this case we want to have 2 query in one procedure.
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT * 
FROM employee_salary
WHERE salary >= 10000;

-- here is the solution
-- PS : U cant put comment between the delimiter, u know u would know it
DELIMITER $$ 
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ; 

CALL large_salaries3();

CALL new_procedure();

-- stored procedure with parameter
CREATE PROCEDURE procedure_param(p_employee_id INT)
SELECT *
FROM employee_demographics dem
WHERE dem.employee_id = p_employee_id
;

CALL procedure_param(1);
