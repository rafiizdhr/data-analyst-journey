-- Joins

SELECT *
FROM employee_demographics;
SELECT *
FROM employee_salary;

SELECT * 
FROM employee_demographics
JOIN employee_salary -- by default is INNER JOIN, or can be JOIN like the instance
	ON employee_demographics.employee_id = employee_salary.employee_id;

-- use aliasing for best practice    
SELECT * 
FROM employee_demographics AS dem
JOIN employee_salary AS sal -- by default is INNER JOIN, or can be JOIN like the instance
	ON dem.employee_id = sal.employee_id;    
    
SELECT dem.employee_id, age, occupation -- when both tabel has a same column name, it has to denote the table name
FROM employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id;    


-- Outer Joins (left join and right join, left outer join or right outer join)    
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal -- taking all from left table and matches the right table, left dlu tampilin semua baru right
	ON dem.employee_id = sal.employee_id;     
    
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal -- taking all from right table and matches the left table, right dlu tampilin semua baru left
	ON dem.employee_id = sal.employee_id;      
    
-- Self Join
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id;
    
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;    

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1 
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
-- Joining multiple tables together    

SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;

SELECT * 
FROM parks_departments;
    
    