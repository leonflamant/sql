SELECT title, author FROM books WHERE release IN (SELECT MIN(release) FROM books GROUP BY author ORDER BY author) ORDER BY title, author; 
