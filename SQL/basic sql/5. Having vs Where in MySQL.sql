-- Having vs Where ()
-- in short, WHERE filters the raw data, while HAVING filters the aggregated results.

-- notes: having clause is applied after group by clause and purpose of using having clause is when u want to filter aggregated function
-- (which usually u use where to filter row, but in case of filtering row with aggregated function use having instead)
-- and when u want to use where and having clause when use group by clause, use where to filter the row for group by (filter raw data) and use
-- having to filter aggregated function.

SELECT gender, AVG(age) 
FROM employee_demographics 
GROUP BY gender 
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;

-- Alex said:
-- Both were created to filter rows of data, but they filter 2 separate things
-- Where is going to filters rows based off columns of data
-- Having is going to filter rows based off aggregated columns when grouped
