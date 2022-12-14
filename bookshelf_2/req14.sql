SELECT name, death_date - birth_date AS days FROM authors WHERE death_date IS NOT NULL UNION SELECT name, '2000-01-01' - birth_date FROM authors WHERE death_date IS NULL AND birth_date <= '2000-01-01' ORDER BY name;