SELECT title, author, release FROM books WHERE CAST(EXTRACT('year' FROM release) AS INT) < 1900 OR CAST(EXTRACT('year' FROM release) AS INT) >= 2000 ORDER BY release DESC, title, author;
