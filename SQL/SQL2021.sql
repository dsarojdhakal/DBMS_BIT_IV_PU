Member(mid, name, age)
Book(isbn, title, author, publisher)
Borrower(mid, isbn, date)

1. Write sql to create above tables.

    CREATE TABLE Member (
        mid INT PRIMARY KEY,
        name VARCHAR(100),
        age INT
    );

    CREATE TABLE Book (
        isbn VARCHAR(20) PRIMARY KEY,
        title VARCHAR(255),
        author VARCHAR(100),
        publisher VARCHAR(100)
    );

    CREATE TABLE Borrower (
        mid INT,
        isbn VARCHAR(20),
        date DATE,
        PRIMARY KEY (mid, isbn, date),
        FOREIGN KEY (mid) REFERENCES Member(mid),
        FOREIGN KEY (isbn) REFERENCES Book(isbn)
    );


2.write sql to display total no. of books taken by each member, 

    SELECT m.name, COUNT(b.isbn) AS total_books
    FROM Member m
    JOIN Borrower b ON m.mid = b.mid
    GROUP BY m.mid, m.name;


3.write sql query to display member name, age, isbn, title and dsate for all members, 

    SELECT m.name, m.age, b.isbn, bk.title, b.date
    FROM Member m
    JOIN Borrower b ON m.mid = b.mid
    JOIN Book bk ON b.isbn = bk.isbn;

4.write sql query to display age of mamber who has taken the book written by "Laxmi Prasad"

    SELECT DISTINCT m.age
    FROM Member m
    JOIN Borrower b ON m.mid = b.mid
    JOIN Book bk ON b.isbn = bk.isbn
    WHERE bk.author = 'Laxmi Prasad';
