/*
Student name: Omar Zaman                           
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE Customer (
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_number VARCHAR(15) NOT NULL, 
    customer_email VARCHAR(255) NOT NULL UNIQUE,
    referenced_by VARCHAR(255),
    FOREIGN KEY (referenced_by) REFERENCES Customer(customer_id)
);


CREATE TABLE Rent_Transactions (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_date DATE NOT NULL,
    return_date DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    customer_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Equipment (
    equipment_id VARCHAR(255) PRIMARY KEY,
    equipment_serial_number INT NOT NULL UNIQUE,
    equipment_brand VARCHAR(255) NOT NULL,
    equipment_type VARCHAR(255) NOT NULL,
    equipment_condition VARCHAR(50) NOT NULL,
    is_available BOOLEAN NOT NULL
);

CREATE TABLE Rent_Details (
    rental_id INT NOT NULL,
    equipment_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (rental_id, equipment_id),
    FOREIGN KEY (rental_id) REFERENCES Rent_Transactions(rental_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

CREATE TABLE Product (
    product_id VARCHAR(255) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    maintenance_date DATE NOT NULL,
    maintenance_cost DECIMAL(10, 2) NOT NULL,
    maintenance_type VARCHAR(255) NOT NULL,
    equipment_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);


/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO Customer VALUES 
('CUST001', 'Zain Smith', '1234567890', 'Zain.smith@example.com', NULL),
('CUST002', 'Hamza Johnson', '9876543210', 'Hamza.johnson@example.com', 'CUST001'),
('CUST003', 'Mikail Brown', '1112223333', 'Mikail.brown@example.com', NULL),
('CUST004', 'David Laid', '4445556666', 'david.laid@example.com', NULL),
('CUST005', 'Rayyane Green', '7778889999', 'Rayyane.green@example.com', 'CUST003');

INSERT INTO Rent_Transactions VALUES 
(1, '2024-01-15', '2024-01-20', 150.50, 'CUST001'),
(2, '2024-01-16', '2024-01-18', 75.00, 'CUST002'),
(3, '2024-02-01', '2024-02-10', 200.00, 'CUST003'),
(4, '2024-02-05', '2024-02-12', 300.00, 'CUST004'),
(5, '2024-03-01', '2024-03-05', 100.00, 'CUST005');

INSERT INTO Equipment VALUES 
('EQ001', 10001, 'Canon', 'Camera', 'New', TRUE),
('EQ002', 10002, 'Nikon', 'Lens', 'Good', TRUE),
('EQ003', 10003, 'Sony', 'Camera', 'Used', FALSE),
('EQ004', 10004, 'Fujifilm', 'Lens', 'New', TRUE),
('EQ005', 10005, 'GoPro', 'Camera', 'Fair', TRUE);

INSERT INTO Rent_Details VALUES 
(1, 'EQ001'),
(1, 'EQ002'),
(2, 'EQ003'),
(3, 'EQ004'),
(4, 'EQ005'),
(5, 'EQ001');

INSERT INTO Product VALUES 
('P001', 'Canon EOS R5'),
('P002', 'Nikon Z6 II'),
('P003', 'Sony A7 III'),
('P004', 'Fujifilm XF 16-55mm'),
('P005', 'GoPro Hero 10');

INSERT INTO Maintenance VALUES
(1, '2023-12-01', 50.00, 'Cleaning', 'EQ001'),
(2, '2023-11-15', 75.00, 'Repair', 'EQ003'),
(3, '2024-01-10', 100.00, 'Replacement', 'EQ005'),
(4, '2024-01-20', 25.00, 'Cleaning', 'EQ002'),
(5, '2024-02-05', 60.00, 'Calibration', 'EQ004');


                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) This marks the equipment 'Sony A7 III' as unavailable because its currently being rented out. */

UPDATE Equipment 
SET is_available = FALSE 
WHERE equipment_id = 'EQ003';

/* 2) This updates all customers who were referred by 'Zain Smith' to be flagged with a new referenced_by ID. */

UPDATE Customer 
SET referenced_by = 'CUST001' 
WHERE referenced_by IS NULL AND customer_name != 'Zain Smith';

/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 
1) This select statement will retrieve the names and emails of all the customers who have rented equipment costing more than £200. 
*/
select '1)' AS '';


SELECT Customer.customer_name, Customer.customer_email
FROM Customer
JOIN Rent_Transactions ON Customer.customer_id = Rent_Transactions.customer_id
WHERE Rent_Transactions.total_cost > 200;

/* 
2) This select statement will display all equipment that is currently unavailable along with its condition and brand.
*/
select '2)' AS '';


SELECT equipment_id, equipment_condition, equipment_brand
FROM Equipment
WHERE is_available = FALSE;

/* 
3) This select statement finds all customers who were referred by another customer and displays their names and the names of the referrers. 
*/
select '3)' AS '';


SELECT c1.customer_name AS referred_customer, c2.customer_name AS referrer
FROM Customer c1
JOIN Customer c2 ON c1.referenced_by = c2.customer_id;

/* 
4) This select statement will show the total maintenance cost for each piece of equipment.
*/

select '4)' AS '';

SELECT Equipment.equipment_id, Equipment.equipment_brand, SUM(Maintenance.maintenance_cost) AS total_maintenance_cost
FROM Equipment
JOIN Maintenance ON Equipment.equipment_id = Maintenance.equipment_id
GROUP BY Equipment.equipment_id, Equipment.equipment_brand
HAVING SUM(Maintenance.maintenance_cost) > 0;

/* 
5)  This select statement will retrieve the details of all rental transactions ever, including the customer name, rental date, and total cost, in descending order of total cost. 
*/

select '5)' AS '';

SELECT Customer.customer_name, Rent_Transactions.rental_date, Rent_Transactions.total_cost
FROM Customer
JOIN Rent_Transactions ON Customer.customer_id = Rent_Transactions.customer_id
ORDER BY Rent_Transactions.total_cost DESC;


/* 
6) This select statement will List all the equipment that has undergone maintenance and shows the equipment ID, maintenance date, and maintenance type. 
*/

select '6)' AS '';

SELECT Equipment.equipment_id, Maintenance.maintenance_date, Maintenance.maintenance_type
FROM Equipment
JOIN Maintenance ON Equipment.equipment_id = Maintenance.equipment_id;


/* 
7) This select statement finds the most expensive piece of equipment that has been rented out in a single transaction and the customer who rented it. 
*/

select '7)' AS '';
SELECT Customer.customer_name, Equipment.equipment_brand, Equipment.equipment_type, Rent_Transactions.total_cost
FROM Customer
JOIN Rent_Transactions ON Customer.customer_id = Rent_Transactions.customer_id
JOIN Rent_Details ON Rent_Transactions.rental_id = Rent_Details.rental_id
JOIN Equipment ON Rent_Details.equipment_id = Equipment.equipment_id
ORDER BY Rent_Transactions.total_cost DESC
LIMIT 1;


/* 
8)   This select statement checks if there is any equipment that hasn't been rented out yet and displays their IDs and types. 
*/

select '8)' AS '';

SELECT Equipment.equipment_id, Equipment.equipment_type
FROM Equipment
WHERE Equipment.equipment_id NOT IN (
    SELECT DISTINCT equipment_id FROM Rent_Details
);


/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1) This first delete statement will remove the customer record for 'Rayyane Green' as they no longer wish to use the service.
*/

DELETE FROM Rent_Details 
WHERE rental_id IN (
    SELECT rental_id FROM Rent_Transactions WHERE customer_id = 'CUST005'
);

DELETE FROM Rent_Transactions WHERE customer_id = 'CUST005';


DELETE FROM Customer WHERE customer_name = 'Rayyane Green';

/*
2) This delete statement will delete all maintenance records for the equipment that has not undergone maintenance costing more than 50. 
*/

DELETE FROM Maintenance WHERE maintenance_cost <= 50;



/* SECTION 6 - DROP TABLES */

DROP TABLE IF EXISTS Rent_Details;
DROP TABLE IF EXISTS Rent_Transactions;
DROP TABLE IF EXISTS Maintenance;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;



SHOW TABLES;