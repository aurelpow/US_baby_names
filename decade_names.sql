 -- QUERY to have the famoust names by Decade : 
 CREATE VIEW decade_names AS 
 WITH decade_add AS 
 ( SELECT *,
  		(CAST((year /10) AS INT) * 10 ) AS Decade_start 
  FROM NationalNames
  where year >= 1920 
  ),
decade_query AS 
( SELECT Decade_start, 
 		Decade_start || '-' || (Decade_start +9) AS Decade ,
 		Name,
        gender,
 		SUM(COUNT) AS count_names
 	FROM decade_add
 	GROUP BY 1,2,3,4
 	ORDER BY Decade_start DESC , 5 DESC 
 )
SELECT *, 
RANK() OVER(PARTITION BY Decade ORDER BY count_names DESC ) AS rank_decade
FROM decade_query 