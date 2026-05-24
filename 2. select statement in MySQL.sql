#sql = sensitive case, SELECT = select = SeleCt

# select all from data
select * from employee_demographics; #the parks and recreation need to be bold in schemas (by double click it)
select * from parks_and_recreation.employee_demographics;

# select just a specific column from data
# (bisa gini atau spt di bawah) 
select first_name, last_name, age from parks_and_recreation.employee_demographics;
select first_name, 
last_name, 
age,
(age + 10) * 10 + 10
from parks_and_recreation.employee_demographics;
#PEMDAS (Parantheses, Exponent, Multiplication, Division, Addition, Substraction), aturan yang ada saat terjadi operasi matematika

# penggunaan distinct

select gender 
from parks_and_recreation.employee_demographics; # gender harusnya unique so use distinct
select distinct gender 
from parks_and_recreation.employee_demographics;

# what if the distinct called with first_name and gender
select distinct first_name, gender
from parks_and_recreation.employee_demographics; #ketampil semua karena first_name unik semua namanya beda beda
