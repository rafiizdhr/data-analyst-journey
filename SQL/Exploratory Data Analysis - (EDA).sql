-- EDA stands for Exploratory Data Analysis
-- note: sometimes when u already do cleaning ur datasets and do the analysis of EDA process u will get any issue like u must cleaning it again
-- EDA: explore the data and find trends or patterns or anything interesting like outliers, when start doing EDA process, he said normally u have some idea
-- of what ur looking for, but with this we're trying to look around and what we cand find.

SELECT * 
FROM layoffs_staging2;

SELECT MAX(total_laid_off)
FROM layoffs_staging2; -- so total laid of in one time or in a day (not sure, can be wrong) is 12k people

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;-- this dataset was in 11-03-2020 until 06-03-2023

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT company, ROW_NUMBER() OVER()
FROM layoffs_staging2
GROUP BY company; -- there are 1628 company

SELECT *
FROM layoffs_staging2
WHERE company = '100 Thieves';

SELECT * 
FROM layoffs_staging2
ORDER BY total_laid_off DESC; -- google, meta, amazon the big large company is the most having of total_laid_off

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC; -- yet total laid off by amazon is 18.150, google 12000 in the dataset period

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC; -- total laid off the most in industry is Consumer, retail, transportation, and others in order
-- still the query above, industry with the minimum total laid off are in manufacturing, fin-tech, aerospace, energy, and others in order

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC; -- united state with the most total laid off at 256559, followed by india, netherlands, sweden, and others

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC; -- this checking total laid off per year from 2020-2023

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`, 1,7) `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1;

WITH Rolling_total AS
(
	SELECT SUBSTRING(`date`, 1, 7) `MONTH`, SUM(total_laid_off) total_off
    FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY `MONTH`
    ORDER BY 1
)
SELECT `MONTH`, total_off,SUM(total_off) OVER(ORDER BY `MONTH`) rolling_total
FROM Rolling_total; -- each month how many was laid off, using rolling total so u can see example of from 2020-03 until 2020-06 is 69769 people was laid off
-- more usefull insight to see with this cte and rolling total stuff than using query below

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY SUM(total_laid_off) DESC;

WITH Company_Year (company, years, total_laid_off) AS
(
	SELECT company, YEAR(`date`), SUM(total_laid_off)
	FROM layoffs_staging2
	GROUP BY company, YEAR(`date`)
), Company_Year_Ranking AS
(
	SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) Ranking
	FROM Company_Year
	WHERE years IS NOT NULL
) 
SELECT * 
FROM Company_Year_Ranking
WHERE Ranking <= 5
; -- well some complex query


















-- JUST SOME OF MY CURIOUS NOT PART OF THE VIDEO
WITH Rolling_total AS
(
	SELECT SUBSTRING(`date`, 1, 7) `MONTH`, SUM(total_laid_off) total_off
    FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY `MONTH`
    ORDER BY 1
)
SELECT `MONTH`, total_off,SUM(total_off) OVER(ORDER BY `MONTH`) rolling_total
FROM Rolling_total
WHERE `MONTH` BETWEEN '2021-03' AND '2021-07'; -- another example of filtering like from 2021-03 - 2021-07

SELECT SUBSTRING(`date`,1,4), SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,4) IS NOT NULL
GROUP BY SUBSTRING(`date`,1,4)
ORDER BY 1; -- but this is exact year with exact total laid off by that year

SELECT
    SUM(CASE WHEN company IS NOT NULL THEN total_laid_off ELSE 0 END) AS com,
    SUM(CASE WHEN location IS NOT NULL THEN total_laid_off ELSE 0 END) AS loc,
    SUM(CASE WHEN industry IS NOT NULL THEN total_laid_off ELSE 0 END) AS ind,
    SUM(CASE WHEN total_laid_off IS NOT NULL THEN total_laid_off ELSE 0 END) AS tlo,
    SUM(CASE WHEN percentage_laid_off IS NOT NULL THEN total_laid_off ELSE 0 END) AS plo,
    SUM(CASE WHEN `date` IS NOT NULL THEN total_laid_off ELSE 0 END) AS dt,
    SUM(CASE WHEN stage IS NOT NULL THEN total_laid_off ELSE 0 END) AS stage,
    SUM(CASE WHEN country IS NOT NULL THEN total_laid_off ELSE 0 END) AS country,
    SUM(CASE WHEN funds_raised_millions IS NOT NULL THEN total_laid_off ELSE 0 END) AS frm
FROM layoffs_staging2;

SELECT
    SUM(company IS NULL) AS company_null,
    SUM(location IS NULL) AS location_null,
    SUM(industry IS NULL) AS industry_null,
    SUM(`date` IS NULL) AS date_null,
    SUM(stage IS NULL) AS stage_null,
    SUM(country IS NULL) AS country_null,
    SUM(funds_raised_millions IS NULL) AS frm_null,
    SUM(percentage_laid_off IS NULL) AS plo_null,
    SUM(total_laid_off IS NULL) AS tlo_null
FROM layoffs_staging2; -- is to check how many data was null in each column

SELECT
    COUNT(*) - COUNT(company) AS company_null,
    COUNT(*) - COUNT(location) AS location_null,
    COUNT(*) - COUNT(industry) AS industry_null
FROM layoffs_staging2;

SELECT SUM(total_laid_off)
FROM layoffs_staging2
WHERE company IS NOT NULL;






































