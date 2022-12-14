SELECT CONCAT(LEFT(acronym,2),LPAD(SUBSTRING(acronym, 3, 4), 2, '0')) as acronym FROM destination ORDER BY acronym;
