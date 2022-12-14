SELECT title, author FROM books JOIN authors ON books.author = authors.name WHERE country = 'France' AND genre = 'Poem' ORDER BY title, author;
