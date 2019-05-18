Step 1
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
- Create second table in normalized database.

Step 2
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
- Insert distinct bookshelf names from books in bookshelves.

Step 3
ALTER TABLE books ADD COLUMN bookshelf_id INT;
- Add a column that will be used as the foreign key in books.


Step 4
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
- Prepares a connection between books and bookshelves based on the foreign key.

Step 5
ALTER TABLE books DROP COLUMN bookshelf;
- remove the bookshelf column from books as relationship is established by the foreign key now.


Step 6
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
- Binds the foreign key in books to bookshelves table.