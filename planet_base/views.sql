CREATE VIEW view_nearest_planet_to_sun AS
    SELECT planet.name AS "planet" FROM planet
    JOIN planetary_system ON planet.id_system = planetary_system.id
    WHERE upper(star) = 'SUN'
    ORDER BY period
    LIMIT 3;

CREATE view sat_bis AS
    SELECT * from satellite
    WHERE radius >= 500;

CREATE view a AS
    (select planet.name from planet)
    EXCEPT
    (SELECT planet.name from planet
    JOIN sat_bis ON sat_bis.id_planet = planet.id);

CREATE view has_sat AS
SELECT planet.name, count(*) as "number of satellites" FROM planet
JOIN sat_bis ON sat_bis.id_planet = planet.id
GROUP BY planet.name;

create VIEW view_nb_satellite_per_planet  as
    (SELECT name as "planet", '0' AS "number of satellites" FROM a ORDER BY name)
    UNION
    (select name as "planet", "number of satellites" from has_sat ORDER BY "number of satellites", name)
    ORDER BY "number of satellites", "planet"
    LIMIT 1000000;

CREATE VIEW res1 AS
    (SELECT planetary_system.name AS system FROM planetary_system)
    EXCEPT
    (SELECT planetary_system.name AS system FROM planetary_system
    JOIN planet ON planetary_system.id = planet.id_system);

CREATE VIEW res1bis AS
    SELECT system, 0.00 as average_period FROM res1;

CREATE VIEW res2 AS
SELECT planetary_system.name AS system, ROUND(AVG(period),2) as average_period FROM planet
JOIN planetary_system ON planet.id_system = planetary_system.id
    GROUP BY planetary_system.name; 

CREATE VIEW view_average_period AS
    SELECT * FROM res1bis
    UNION
    SELECT * FROM RES2
    ORDER BY average_period, system
    LIMIT 10000;

CREATE VIEW pla AS 
    SELECT 'planet' as type, planetary_system.name as system, planet.name as name, radius
    FROM planet
    JOIN planetary_system ON planetary_system.id = planet.id_system;

CREATE VIEW sat AS
    SELECT 'satellite' as type, planetary_system.name as system, satellite.name as name, satellite.radius
    FROM satellite
    JOIN planet ON planet.id = satellite.id_planet
    JOIN planetary_system ON planetary_system.id = planet.id_system;

CREATE VIEW view_biggest_entities AS
    SELECT * FROM SAT
    UNION
    SELECT * FROM PLA
    ORDER BY radius DESC, name
    LIMIT 10;
