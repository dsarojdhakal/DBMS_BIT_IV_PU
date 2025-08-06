Consider the following schema for Order Database:
        SALESMAN (Salesman_id, Name, City, Commission)
        CUSTOMER (Customer_id, Cust_Name, City, Grade, Salesman_id)
        ORDERS (Ord_No, Purchase_Amt, Ord_Date, Customer_id, Salesman_id)

SQL Queries for:

1. Count the customers with grades above Amritsar’s average.
        SELECT COUNT(*) 
        FROM CUSTOMER 
        WHERE Grade > (
            SELECT AVG(Grade) 
            FROM CUSTOMER 
            WHERE City = 'Amritsar'
        );

2. Find the name and numbers of all salesmen who had more than one customer.
        SELECT S.Salesman_id, S.Name, COUNT(C.Customer_id) AS Num_Customers
        FROM SALESMAN S
        JOIN CUSTOMER C ON S.Salesman_id = C.Salesman_id
        GROUP BY S.Salesman_id, S.Name
        HAVING COUNT(C.Customer_id) > 1;

3. List all salesmen and indicate those who have and don’t have customers in their cities (Use UNION operation.)
        SELECT S.Name, S.City, 'Has Customer' AS Status
        FROM SALESMAN S, CUSTOMER C
        WHERE S.Salesman_id = C.Salesman_id AND S.City = C.City
        UNION
        SELECT S.Name, S.City, 'No Customer' AS Status
        FROM SALESMAN S
        WHERE S.Salesman_id NOT IN (
            SELECT C.Salesman_id FROM CUSTOMER C WHERE S.City = C.City
        );

4. Create a view that finds the salesman who has the customer with the highest order of a day.
        CREATE VIEW Top_Salesman_View AS
        SELECT O.Ord_Date, S.Salesman_id, S.Name
        FROM ORDERS O
        JOIN CUSTOMER C ON O.Customer_id = C.Customer_id
        JOIN SALESMAN S ON O.Salesman_id = S.Salesman_id
        WHERE O.Purchase_Amt = (
            SELECT MAX(Purchase_Amt)
            FROM ORDERS O2
            WHERE O2.Ord_Date = O.Ord_Date
        );

5. Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted.
        DELETE FROM ORDERS WHERE Salesman_id = 1000;
        DELETE FROM SALESMAN WHERE Salesman_id = 1000;
