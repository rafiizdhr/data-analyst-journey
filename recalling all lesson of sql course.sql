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


-- studi kasus nambahkan tiga table dengan join, employee_salary sebagai tabel utama (but the salary table was in between demographics and pd table)
select *
from employee_demographics dem
right join employee_salary sal
	on dem.employee_id = sal.employee_id
left join parks_departments pd
	on sal.dept_id = pd.department_id;
-- or
-- this query, table salary was in left column, followed by demographics and pd table (but more suitable query above)
select *
from employee_salary sal
left join employee_demographics dem
	on sal.employee_id = dem.employee_id
left join parks_departments pd
	on sal.dept_id = pd.department_id;
    
    
SELECT first_name, last_name
FROM employee_demographics
UNION -- Explicitly it was UNION DISTINCT, only unique value
SELECT first_name, last_name
FROM employee_salary;    

SELECT ROW_NUMBER() OVER() AS no,
       first_name,
       last_name
FROM employee_demographics

UNION

SELECT ROW_NUMBER() OVER() AS no,
       first_name,
       last_name
FROM employee_salary;

SELECT ROW_NUMBER() OVER() AS no,
       first_name,
       last_name
FROM (
    SELECT first_name, last_name
    FROM employee_demographics

    UNION

    SELECT first_name, last_name
    FROM employee_salary
) t;

select * from employee_demographics dem join employee_salary sal on dem.employee_id = sal.employee_id;

-- tampilin old man, old lady, highly paid employee dengan union clause
select first_name, last_name, age, gender, '' as salary, 'Old Man' as Lable
from employee_demographics
where age > 40 and gender = 'Male'
union
select first_name, last_name, age, gender, '' as salary, 'Old Lady' as Lable
from employee_demographics
where age > 40 and gender = 'Female'
union
select first_name, last_name, '' as age, '' as gender, salary, 'Highly Paid Employee' as Lable
from employee_salary
where salary >= 70000; 

SELECT LENGTH('skyfall');

SELECT employee_id, first_name, LENGTH(first_name) char_length
FROM employee_demographics
ORDER BY 3;

SELECT first_name, 
LEFT(first_name, 4), -- ex Leslie, will be Lesl, April will be Apri
RIGHT(first_name, 4), -- ex Leslie, will be slie, April will be pril
SUBSTRING(first_name, 3, 2), -- ex Leslie will be sl, tom is m, april is ri, dari posisi 3, ambil 3 dan 4 karena 2
birth_date,
SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;
;

SELECT first_name, LOCATE('ra', first_name) -- an ada di posisi 1, pada setiap nama kalo gada 0
FROM employee_demographics;
    
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) full_name -- concat will combine it
FROM employee_demographics;    

select first_name, last_name, age,
CASE
	when age <= 30 then 'young'
    when age between 31 and 40 then 'old'
    when age >= 41 then "on death's door"
END age_bracket
from employee_demographics;

-- example case statement
-- Pay Increase and Bonus
-- < 50000 = 5% 
-- > 50000 = 7%
-- Finance = 10% bonus
select first_name, last_name, salary,
CASE
	when salary < 50000 then salary * 0.05
    when salary > 50000 then salary * 0.07
END increase_value,
CASE
	when salary < 50000 then salary + salary * 0.05
    when salary > 50000 then salary + salary * 0.07
END new_salary,
CASE
	when dept_id = 6 then salary * 0.1
END bonus
from employee_salary;

-- subqueries
-- example want to show some people from park n rec dept (this data in salary), but we
-- want to retrieve data from demographics table
select * 
from employee_demographics
where employee_id in (select employee_id from employee_salary where dept_id = 1);
-- this using with join to show park and rec people
select *
from employee_demographics
where employee_id in 
(
	select employee_id
	from employee_salary sal
	join parks_departments pd
	on sal.dept_id = pd.department_id
	where dept_id = 1
);
--
select first_name, salary,
(
	select avg(salary)
    from employee_salary
) from employee_salary;
--
select first_name, salary, (select avg(salary) from employee_salary) 
from employee_salary;
--
SELECT gender, AVG(Min_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
GROUP BY gender
;
-- the subquery itself like making a new table
select gender, avg_age
from 
(
	select gender, avg(age) avg_age, sum(age) sum_age, count(age) count_age, min(age) min_age, max(age) max_age -- aliasing biar bisa dipanggil di outer query
    from employee_demographics
    group by gender
) agg_table -- table from subquery has to be named
group by gender;

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- it's giving us the average PER GROUP which we don't want
-- here's a good use for a subquery

SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary)
FROM employee_salary;
--
SELECT gender, ROUND(AVG(salary),1)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;
--
select dem.employee_id, dem.first_name, gender, salary, avg(salary) over(partition by gender) avg_sal
from employee_demographics dem
join employee_salary sal
	on sal.employee_id = dem.employee_id;

select *, row_number() over() from employee_demographics;
select *, row_number() over() from employee_salary;
      
-- ranking by salary, joining two table demographics and salary
select 
-- row_number() over() `No`,
 concat(sal.first_name, ' ', sal.last_name) full_name, age, salary,
rank() over(order by salary desc) ranking_gaji, -- (UNTUK URUTAN GAJI LEBIH BAIK DENSE RANK)
dense_rank() over(order by salary desc) ranking_gaji2
from employee_demographics dem
right join employee_salary sal
	on dem.employee_id = sal.employee_id;




