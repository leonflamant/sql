CREATE TABLE res(
    id  SERIAL  PRIMARY KEY,
    date VARCHAR(64)   NOT NULL,
    op BIGINT   NOT NULL,
    np BIGINT   NOT NULL
);

CREATE FUNCTION res_id()
RETURNS INTEGER AS $$
DECLARE
    max int := (SELECT max(id) + 1 as id from res);
BEGIN
    IF max IS NULL THEN
        RETURN 1;
    ELSE
        RETURN max;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION _in_store()
RETURNS TRIGGER AS $NW$
BEGIN
    INSERT INTO res VALUES(res_id(), to_char(now()::timestamp(3),'DD/MM/YYYY HH24:MI'), old.population, new.population);
    RETURN NULL;
END
$NW$ LANGUAGE plpgsql;

CREATE TRIGGER test 
AFTER UPDATE ON planet
FOR EACH ROW
WHEN (NEW.name = 'Earth' AND OLD.population IS DISTINCT FROM NEW.population)
EXECUTE PROCEDURE _in_store();

CREATE VIEW view_earth_population_evolution AS
    SELECT id, date, op as "old population", np as "new population" FROM res;
