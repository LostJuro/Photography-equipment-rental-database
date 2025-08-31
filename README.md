# Photography-equipment-rental-database


Project Overview

This project is a Photography Equipment Rental Database, designed to manage the inventory, rentals, transactions, and maintenance of photography equipment. Users can rent equipment, and the system tracks customer details, rental history, and maintenance records.

The database is implemented using SQL and was developed and tested in DataGrip.

Features

Customer Management:
Stores customer information including name, contact details, and referral relationships.

Equipment Inventory:
Tracks equipment specifications such as brand, type, condition, and availability status.

Rental Transactions:
Manages customer rentals, including rental dates, return dates, and total costs.

Rental Details:
Maintains which equipment items are rented in each transaction.

Maintenance Records:
Tracks maintenance activities, dates, types, and associated costs for each piece of equipment.

The database consists of 6 tables:

Customer – stores customer data and referral relationships.

Rent_Transactions – records each rental transaction with associated customer.

Equipment – stores inventory and equipment details.

Rent_Details – links rentals to the specific equipment rented.

Product – optional table to store product catalog information.

Maintenance – stores maintenance history for each piece of equipment.

Key relationships include:

Primary Keys for unique identification.

Foreign Keys to maintain relationships between tables.

Recursive Relationship in Customer table for referral tracking.

The project includes 21 SQL queries demonstrating:

INSERT, UPDATE, DELETE operations

SELECT queries including joins, aggregation, filtering, and ordering

Advanced queries such as finding top rented or maintained equipment, and customers referred by others

Ensuring data integrity through constraints
