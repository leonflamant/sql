CREATE FUNCTION add_book(title VARCHAR(64), author VARCHAR(64), genre VARCHAR(64), release_date DATE)
RETURNS BOOLEAN AS $$
BEGIN
    IF author IN (SELECT INTO name FROM authors) THEN
	INSERT INTO books(title,author,genre,release) VALUES(title,author,genre,release_date);
	RETURN TRUE;
    ELSE
	RETURN FALSE;
    END IF;
END;
$$ LANGUAGE plpgsql;
