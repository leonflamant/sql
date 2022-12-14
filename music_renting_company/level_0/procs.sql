CREATE FUNCTION duration_to_string(seconds INTEGER)
RETURNS VARCHAR(8) AS
$$
BEGIN
    CASE
	WHEN seconds IS NULL THEN RETURN '0:00';
	WHEN seconds <= 0 THEN RETURN '0:00';
	WHEN seconds % 60 < 10 THEN RETURN (seconds / 60) || ':0' || (seconds % 60); 
	ELSE RETURN (seconds / 60) || ':' || (seconds % 60);
    END CASE;
END;
$$
LANGUAGE plpgsql;
