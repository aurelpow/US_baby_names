-- Query to have the name ranking by year :
CREATE VIEW rank_by_year AS 
-- First we use a CTE to have the SUM by state and by year for each couple of name&gender : 
WITH total_years AS 
(SELECT year, name, gender,
	SUM(count) OVER(PARTITION BY year,name, gender) AS total_by_year,
	SUM(count) AS total_names
FROM NationalNames
GROUP BY 1,2,3
ORDER BY 4 DESC )
-- After that we use the CTE created above to have the rank : 
SELECT *, 
RANK() OVER(PARTITION BY year ORDER BY total_by_year DESC ) AS rank_year
FROM total_years
WHERE year >= 1940
