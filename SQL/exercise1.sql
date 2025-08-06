a. Use of CREATE, ALTER, RENAME and DROP statement in the database tables:

      1. CREATE TABLE students (
         id INT PRIMARY KEY,
         name VARCHAR(50),
         age INT
      );

      2. ALTER TABLE students ADD email VARCHAR(100);

      3. RENAME TABLE students TO student_info;

      4. DROP TABLE student_info;


b. Use of INSERT INTO, DELETE and UPDATE statement in database tables:

      1. INSERT INTO students (id, name, age, email) VALUES (1, 'John Doe', 20, 'john@example.com');

      2. DELETE FROM students WHERE id = 1;

      3. UPDATE students SET age = 21 WHERE id = 1;


c. Use of simple SELECT statement:

      1. SELECT * FROM students;
      2. SELECT name, age FROM students;


d. Use of nesting of queries:

      1. SELECT name FROM students WHERE age = (SELECT MAX(age) FROM students);


e. Use of aggregate functions:

      1. SELECT COUNT(*) FROM students;
      2. SELECT AVG(age) FROM students;
      3. SELECT MIN(age), MAX(age) FROM students;


f. Use of queries to create joins and views:

      1. JOIN Example:
         SELECT s.name, m.marks
         FROM students s
         INNER JOIN marks m ON s.id = m.student_id;

      2. VIEW Example:
         CREATE VIEW student_view AS
         SELECT name, age FROM students WHERE age > 18;
