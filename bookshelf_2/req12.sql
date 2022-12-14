SELECT title, name FROM books JOIN authors ON authors.name = books.author WHERE death_date IS NOT NULL AND release > death_date ORDER BY title, name; 
