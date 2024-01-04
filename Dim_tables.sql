-- DIM_STATES : 
  -- Query to create a dimension table with all the states : 
  CREATE VIEW dim_states AS 
  SELECT state
  FROM StateNames
  GROUP BY state
-- DIM_NAME :   
  -- Query to create a dimension table with all name&gender : 
  CREATE TABLE dim_name AS
  SELECT name, gender
  FROM NationalNames
  GROUP BY name,gender; 
  -- Query to add an index to the dim_name table :
  CREATE INDEX idx_name
  ON dim_name (name, gender);
-- DIM_YEAR :   
  -- Query to create a dimension table with all the years : 
CREATE VIEW dim_year AS 
 WITH decade AS
 (SELECT year,
  		(CAST((year /10) AS INT) * 10 ) AS Decade_start
  FROM NationalNames
 )
SELECT year,
  		Decade_start,
 		Decade_start || '-' || (Decade_start +9) AS Decade
FROM decade
GROUP BY year
