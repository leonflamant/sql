SELECT title, author, EXTRACT('year' FROM release) AS release_year FROM books ORDER BY release_year DESC, title, author;
