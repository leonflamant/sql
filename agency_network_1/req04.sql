SELECT COUNT( DISTINCT city), country FROM destination GROUP BY country ORDER BY COUNT( DISTINCT city) DESC, country;
