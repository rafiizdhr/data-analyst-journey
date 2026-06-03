SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT first_name, salary
FROM employee_salary
WHERE salary = (SELECT MAX(salary) FROM employee_salary)
GROUP BY first_name, salary
;

SELECT first_name, salary
FROM employee_salary
WHERE salary = (SELECT AVG(salary) FROM employee_salary);

-- study case, find out max salary from each gender, gender from demographics and salary from salary
SELECT gender, MAX(salary) AS max_salary
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
GROUP BY gender;
    
-- study case, gabungin tiga table pake join dengan menampilkan semua kolom demographics, tbl salary cuma occupation, (lanjut bwh)
-- salary, dept_id, dan join lagi table reference parks_departments untuk nampilin nama dept_id 1 yaitu department_name nya
SELECT d.*, s.occupation, s.salary, s.dept_id, p.department_name
FROM employee_demographics d
JOIN employee_salary s
	ON d.employee_id = s.employee_id
JOIN parks_departments p
	ON s.dept_id = p.department_id
WHERE d.employee_id IN 
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1)
;

