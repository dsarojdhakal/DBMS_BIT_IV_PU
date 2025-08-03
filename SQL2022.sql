1. write a sql syntax to create the given table and insert two records in it. 

    CREATE TABLE student (
        sno INT PRIMARY KEY,
        sname VARCHAR(100),
        saddress VARCHAR(255),
        sphone VARCHAR(15)
    );

    INSERT INTO student (sno, sname, saddress, sphone) VALUES
    (1, 'Ram', 'Baneshor', '9800000000'),
    (2, 'Shyam', 'Thapathali', '9811111111');

2.write sql query to retrieve all the information whose saddress is baneshor. 

    SELECT * FROM student 
    WHERE saddress = 'Baneshor';

3.write sql syntax to update the phone number to 4000000 whose sname is ram. 

    UPDATE student 
    SET sphone = '4000000' 
    WHERE sname = 'Ram';

4.write a ddl command to insert a new column named semail to the student table.

    ALTER TABLE student 
    ADD COLUMN semail VARCHAR(100);

