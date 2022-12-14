CREATE FUNCTION add_author(name VARCHAR(64),birth_date DATE, death_date DATE,country VARCHAR(64)) 
RETURNS BOOLEAN AS $$
BEGIN
    IF birth_date < death_date THEN
	INSERT INTO authors(name,birth_date,death_date,country) VALUES(name,birth_date,death_date,country);
        RETURN TRUE;
    ELSE
	RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;
