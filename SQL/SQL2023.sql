Product(pid, pname, quantity)
Customer(cid,cname,address)
Buy(pid,cid,quantity,date) 

1. create above table with primary key and foreign key. 

    CREATE TABLE Product (
        pid INT PRIMARY KEY,
        pname VARCHAR(100),
        quantity INT
    );

    CREATE TABLE Customer (
        cid INT PRIMARY KEY,
        cname VARCHAR(100),
        address VARCHAR(255)
    );

    CREATE TABLE Buy (
        pid INT,
        cid INT,
        quantity INT,
        date DATE,
        PRIMARY KEY (pid, cid, date),
        FOREIGN KEY (pid) REFERENCES Product(pid),
        FOREIGN KEY (cid) REFERENCES Customer(cid)
    );

2.display the name and total quantities of all the product sold. 

    SELECT p.pname, SUM(b.quantity) AS total_quantity
    FROM Product p
    JOIN Buy b ON p.pid = b.pid
    GROUP BY p.pname;

3. list the details of all the customers and the products they bought. 

    SELECT c.cid, c.cname, c.address, p.pname, b.quantity
    FROM Customer c
    JOIN Buy b ON c.cid = b.cid
    JOIN Product p ON b.pid = p.pid;

4. display the detail of all the products with quantity less than the average quantity. 

    SELECT *FROM Product
    WHERE quantity < (SELECT AVG(quantity) FROM Product);

5. display total number of customers  from biratnagar

    SELECT COUNT(*) AS total_customers
    FROM Customer
    WHERE address LIKE '%Biratnagar%';

