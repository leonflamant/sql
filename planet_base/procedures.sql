CREATE OR REPLACE FUNCTION enough_population(origin INT, quantity BIGINT)
RETURNS BOOLEAN AS $$
DECLARE
    a BIGINT := (SELECT population FROM planet WHERE id = origin);
BEGIN
    IF a > quantity THEN
        RETURN true;
    ELSE
        RETURN false;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION space_travel(origin INT, destination INT, quantity BIGINT)
RETURNS BOOLEAN AS $$
DECLARE
    a INT := (SELECT id_system FROM planet WHERE id = origin);
    b INT := (SELECT id_system FROM planet WHERE id = destination);
BEGIN
    IF ((a = b) AND enough_population(origin, quantity) AND quantity > 0) THEN
        UPDATE planet
        SET population = population - quantity
        WHERE id = origin;
        UPDATE planet
        SET population = population + quantity
        WHERE id = destination;
        RETURN true;
    ELSE
        RETURN false;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION list_satellite_inf_750(syst INT)
RETURNS TABLE(satellite VARCHAR(32), planet VARCHAR(32), radius INT) AS $$
    SELECT satellite.name as satellite, planet.name as planet, satellite.radius as radius FROM satellite
    JOIN PLANET ON satellite.id_planet = planet.id
    WHERE id_system = syst AND satellite.radius <= 750
    ORDER BY planet.name, satellite.radius DESC, satellite.name;
$$ LANGUAGE SQL;
