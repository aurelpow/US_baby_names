-- Query to have the name ranking by state by year :
CREATE VIEW rank_by_state AS 
-- First we use a CTE to have the SUM by state and by year for each couple of name&gender : 
WITH total_states AS 
(SELECT year, name, gender, state, 
	SUM(count) OVER(PARTITION BY year,name, gender, state) AS total_by_states_year,

	SUM(count) AS total_names
FROM StateNames
GROUP BY 1,2,3,4
ORDER BY 5 DESC ),
-- After that we use the CTE created above to have the rank : 
rank_table AS 
(SELECT *, 
	RANK() OVER(PARTITION BY year, state ORDER BY total_by_states_year DESC ) AS rank_state_year
	FROM total_states)
SELECT * 
FROM rank_table
where year >= 1940