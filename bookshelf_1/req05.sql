SELECT title FROM books WHERE genre LIKE 'Poem' OR (genre LIKE 'Fantasy' and author LIKE 'JK Rowling') ORDER BY title;
