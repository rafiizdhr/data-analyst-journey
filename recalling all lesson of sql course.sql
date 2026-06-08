select * 
from employee_demographics;

select * 
from employee_salary;

SHOW EVENTS; -- finds out what events applied or what events there is
SHOW VARIABLES LIKE 'EVENT%'; -- to find out if event scheduler is on or off nyari tau apakah event scheduler on atau off
SET GLOBAL event_scheduler = OFF; -- turn off event_scheduler, so any event will not work

select * 
from employee_demographics
limit 5;

select *
from employee_demographics
order by age desc
limit 0,1;

select *
from employee_demographics
order by age desc
limit 1,1;

select *
from employee_demographics
order by age desc
limit 2,1;

select *
from employee_demographics
order by age desc
limit 0,2;

select *
from employee_demographics
order by age desc
;

-- joining two table
select *, row_number() over()
from employee_demographics dem
join employee_salary sal -- inner join or just join
	on dem.employee_id = sal.employee_id;
    
-- example of right join, all right join match with left table    
select *, row_number() over()
from employee_demographics dem
right join employee_salary sal
	on dem.employee_id = sal.employee_id;  
    
    
-- example of full join (no syntax full join in mysql workbench, so use left join + union + right join)    
SELECT *
FROM employee_demographics dem
LEFT JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id

UNION

SELECT *
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;  
    
-- self join    
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id;
    
-- another example of self join
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
(emp2.employee_id) AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1 
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
select *, row_number() over()
from employee_demographics dem
left join employee_salary sal
	on dem.employee_id = sal.employee_id
left join parks_departments pd
	on sal.dept_id = pd.department_id;
    
-- select * 
-- from employee_demographics dem
-- left join employee_salary sal
-- 	on dem.employee_id = sal.employee_id
--     
-- union


-- studi kasus nambahkan tiga table dengan join, employee_salary sebagai tabel utama 
select *
from employee_demographics dem
right join employee_salary sal
	on dem.employee_id = sal.employee_id
left join parks_departments pd
	on sal.dept_id = pd.department_id;
    
-- or 

select *
from employee_salary sal
left join employee_demographics dem
	on sal.employee_id = dem.employee_id
left join parks_departments pd
	on sal.dept_id = pd.department_id;
    




