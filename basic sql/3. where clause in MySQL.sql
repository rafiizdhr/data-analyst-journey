SELECT * FROM employee_salary;

SELECT * FROM employee_salary WHERE first_name = 'Leslie';

SELECT * FROM employee_salary WHERE salary > 50000;
SELECT * FROM employee_salary WHERE salary >= 50000;
SELECT * FROM employee_salary WHERE salary < 50000;
SELECT * FROM employee_salary WHERE salary <= 50000;

SELECT * FROM employee_demographics WHERE gender = 'Female';
SELECT * FROM employee_demographics WHERE gender != 'Female';

SELECT * FROM employee_demographics WHERE birth_date > "1985-01-01";

-- AND OR NOT -- Logical Operators
SELECT * FROM employee_demographics WHERE birth_date > "1985-01-01" AND gender = 'Male';

SELECT * FROM employee_demographics WHERE birth_date > "1985-01-01" AND NOT gender = 'Male';

SELECT * FROM employee_demographics WHERE birth_date > "1985-01-01" OR NOT gender = 'Male';
#PEMDAS, Isolated Conditional Statements
SELECT * FROM employee_demographics WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;

# Like Statements, % (comes before %Anything% comes after) _ (Specific Value)
SELECT * FROM employee_demographics WHERE first_name LIKE 'Jer%'; -- starts with Jer
SELECT * FROM employee_demographics WHERE first_name LIKE '%er%'; -- anything with er inside it

SELECT * FROM employee_demographics WHERE first_name LIKE 'a%';
SELECT * FROM employee_demographics WHERE first_name LIKE 'a__'; -- a and two characters after it like 'ann' bcs a_ _ has two underscore
SELECT * FROM employee_demographics WHERE first_name LIKE 'a___';
SELECT * FROM employee_demographics WHERE first_name LIKE 'a___%'; -- can combine with a followed by 3 characters and it can have anything after that

SELECT * FROM employee_demographics WHERE birth_date LIKE '1989%';