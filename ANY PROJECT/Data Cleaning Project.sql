-- Data Cleaning | Project

-- Commonly, data cleaning include :
-- 1. Remove duplicates
-- 2. Standardize the data
-- 3. Null Values or Blank values
-- 4. Remove any columns that aint necessary


-- we dont want to interfere the original raw data (table) for best practice in a real work behaviour.
-- cause the raw data will be used again when we had mistake by the process of data cleaning or anything we want to do with it.
SELECT *
FROM layoffs;

-- so create another table called layoffs_staging from raw table
CREATE TABLE layoffs_staging
LIKE layoffs;

-- after the table was created, we call it and no records of this table
SELECT * 
FROM layoffs_staging;

-- insert or add all records from the raw table to new table that we'll use for this data cleaning
INSERT layoffs_staging
SELECT *
FROM layoffs; 

-- now we've done duplicate or making new table from layoffs table for this data cleaning project
SELECT * 
FROM layoffs_staging;

-- 1. remove any duplicate, with row_number() over(partition by all column essentially) 

-- this query is for checking when u dont partition by all column, it can be a missleading
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

-- now, we want to check that value of row_num column where is greater than 1, which is duplicate
-- using cte or subquery, alex said use cte cause its easy
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1; -- and we get the duplicate where row_num value is 2 or above, but to confirm it check query down below

SELECT * 
FROM layoffs_staging
WHERE company = 'Oda'; -- oda has no duplicate, so we need to specify all column with partition by

-- another checking for all column specified with PARTITION BY
SELECT *, ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
FROM layoffs_staging
WHERE company = 'Casper';

-- now the problem is we dont want to delete all the duplicate, we just want to save one row for each of the duplicates

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY 
company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE 
FROM duplicate_cte
WHERE row_num > 1;
-- we cannot use DELETE or UPDATE on CTE 

-- creating another staging table that has extra row and deleting it where row_num is equal to two
-- (klik kanan table layoffs_staging, copy to clipboard > create statement)
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() 
OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) row_num
FROM layoffs_staging; 

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

-- standardizing data 

-- 1. (trim whitespace)
SELECT company, TRIM(company) 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company); -- done it

-- 2. customize label that can be united
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry; -- and in this query we saw an output for Crypto, Crypto Currency, and CryptoCurrency is labeled the exact same thing

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%'; -- and 95% is labeled crypto rather than crypto currency

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'; -- and done change it

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1; -- checking if there are any issue on location

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1; -- checking if there are any issue, and there is with United States and United States.

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) -- this how to fix '.' in the end
FROM layoffs_staging2
Order by 1;
-- executing it
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT *
FROM layoffs_staging2;

-- next is changing text from date to ...

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y') -- needs 2 parameter, left for column_name, right for the format u want
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y'); -- butthe the definition is still text in the column information
-- time to proving
SELECT *
FROM layoffs_staging2;
-- below, chaning text to date (ONLY DOING THIS WITH STAGING TABLE)alter
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- overcome the null or blank ('') values, wht shld w do with it, make all nulls or all blanks or try to populate that

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

-- below, showing to join when a row with company has an industry value with a row the same data but with null or blank
SELECT t1.company, t1.industry, t2.company, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '') AND t2.industry IS NOT NULL;

-- below, changing all blank values in industry column to all NULL
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;    

-- notes: we can populate total laid off or percentage laid off if we have total all the employees, so we cant do that 
-- here, maybe it can be done by scraping data on a web

-- now try to remove any unnecessary row and columns
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL; -- why we delete this is bcs we dont know if there is any
-- layout so we tryna delete this record, it saying they did but didnt show they laid
-- simplified, we dont need this information
DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

-- deleting row_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;





































































