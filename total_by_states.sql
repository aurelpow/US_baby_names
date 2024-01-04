-- QUERY to have the total of names by states & year : 
CREATE VIEW total_name_states AS 	
  SELECT year, state,gender ,
	SUM(count) AS total_names,
    COUNT(DISTINCT name) AS distinct_names,
    (SELECT COUNT(DISTINCT name) FROM StateNames) AS total_distinct_names
FROM StateNames
GROUP BY year, state, gender
HAVING year >= 1940;