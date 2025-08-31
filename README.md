# Photography Equipment Rental Database

## Project Overview
This project is a **Photography Equipment Rental Database**, designed to manage the inventory, rentals, transactions, and maintenance of photography equipment. Users can rent equipment, and the system tracks customer details, rental history, and maintenance records.

<<<<<<< HEAD
The database is implemented using **SQL** and was developed and tested in **DataGrip**.

---

## Features

- **Customer Management**  
  Stores customer information including name, contact details, and referral relationships.

- **Equipment Inventory**  
  Tracks equipment specifications such as brand, type, condition, and availability status.

- **Rental Transactions**  
  Manages customer rentals, including rental dates, return dates, and total costs.

- **Rental Details**  
  Maintains which equipment items are rented in each transaction.

- **Maintenance Records**  
  Tracks maintenance activities, dates, types, and associated costs for each piece of equipment.

---

## Database Schema

The database consists of **6 tables**:

1. **Customer** – stores customer data and referral relationships.  
2. **Rent_Transactions** – records each rental transaction with associated customer.  
3. **Equipment** – stores inventory and equipment details.  
4. **Rent_Details** – links rentals to the specific equipment rented.  
5. **Product** – optional table to store product catalog information.  
6. **Maintenance** – stores maintenance history for each piece of equipment.

**Key relationships include:**

- **Primary Keys** for unique identification.  
- **Foreign Keys** to maintain relationships between tables.  
- **Recursive Relationship** in Customer table for referral tracking.  

---

## SQL Queries Included

The project includes **21 SQL queries** demonstrating:

- **INSERT, UPDATE, DELETE operations**  
- **SELECT queries** including joins, aggregation, filtering, and ordering  
- **Advanced queries** such as finding top rented or maintained equipment, and customers referred by others  
- Ensuring **data integrity** through constraints  

---

## Skills Demonstrated

- Database **design and normalization**  
- SQL query development and execution  
- Use of **primary and foreign keys**, recursive relationships, and constraints  
- Data management for practical business use-case  

---

## Tools

- **Database IDE**: DataGrip  
- **Database Language**: SQL (MySQL compatible)  

---

## Usage

1. Open the SQL file in DataGrip (or any SQL client).  
2. Execute the **CREATE TABLE statements** to set up the database.  
3. Insert sample data using the **INSERT statements**.  
4. Run the **SELECT queries** to retrieve information on rentals, customers, and maintenance.  
5. Use **UPDATE and DELETE statements** to simulate real-world operations.  

---

## Summary

This project provides a **comprehensive, practical database solution** for a photography rental business, combining inventory management, customer tracking, transaction handling, and equipment maintenance monitoring.
=======

>>>>>>> ae368efe263856b69101b6e957e3e008f9fd1249
