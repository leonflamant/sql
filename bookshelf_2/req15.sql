SELECT author as name, CASE WHEN count(title) > 1 THEN CONCAT(count(title), ' books') ELSE '1 book' END AS stocks FROM books GROUP BY author ORDER BY author;
