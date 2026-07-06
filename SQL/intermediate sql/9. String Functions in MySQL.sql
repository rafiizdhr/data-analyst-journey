-- String Functions

SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name) char_length
FROM employee_demographics
ORDER BY 2
; -- atau kolom length (ada di posisi no 2)

SELECT UPPER('sky'); -- capitaliza all letter (kapitalkan semua huruf)
SELECT LOWER('SKY'); -- lowercase all leter (kecilkan semua huruf)

SELECT first_name, UPPER(first_name) Uppercase_name
FROM employee_demographics;

SELECT ('      sky      ');
SELECT TRIM('      sky      '); -- cut whitespaces
SELECT LTRIM('      sky      '); -- cut left
SELECT RTRIM('      sky      '); -- cut right

-- SUBSTRING EXAMPLE
SELECT first_name, 
LEFT(first_name, 4), -- ex Leslie, will be Lesl, April will be Apri
RIGHT(first_name, 4), -- ex Leslie, will be slie, April will be pril
SUBSTRING(first_name, 3, 2), -- ex Leslie will be sl, tom is m, april is ri, dari posisi 3, ambil 3 dan 4 karena 2
birth_date,
SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z') -- change a char to another char, ex Mark to Mzrk
FROM employee_demographics;

SELECT LOCATE('x', 'Alexandra'); -- x ada di posisi berapa ?, 4
SELECT LOCATE('nd', 'Alexandra'); -- nd ada dari posisi berapa ?, 6
SELECT first_name, LOCATE('An', first_name) -- an ada di posisi 1, pada setiap nama kalo gada 0
FROM employee_demographics;

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) full_name -- concat will combine it
FROM employee_demographics;
