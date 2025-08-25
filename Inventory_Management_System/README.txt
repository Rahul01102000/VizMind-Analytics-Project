Inventory Management System
📌 Project Overview

The Inventory Management System is a database-driven project designed to automate the management of suppliers, products, stock, customers, and orders.
This project was built using SQL Server and demonstrates how to create, manage, and automate an inventory system with stored procedures, functions, and views.

It provides a complete backend solution for:

Supplier management

Product catalog management

Stock tracking

Customer management

Order processing and billing

⚙️ Features

Database Design with normalized tables for SUPPLIER, PRODUCT, STOCK, CUST, and ORDERS.

Data Integrity using constraints like PRIMARY KEY, CHECK, and FOREIGN KEY.

Automation through:

Stored Procedures for adding suppliers, products, customers, and orders with auto-generated IDs.

Sequences and functions to generate unique IDs (S0001, P0001, etc.).

Automatic date handling for orders.

Billing View: A custom view (BillView) to display invoices with customer, product, and total amount details.

Sample Data: Preloaded records for suppliers, products, customers, stock, and orders.

CRUD Operations: Insert, delete, and view operations for all entities.

🗂️ Database Schema

SUPPLIER → Stores supplier details

PRODUCT → Stores product details linked to suppliers

STOCK → Tracks quantity, reorder levels, and minimum order quantity

CUST → Stores customer details with validation (e.g., DOB before 2000)

ORDERS → Manages customer orders linked to products

🔑 Stored Procedures

ADDSUPPLIER → Add a new supplier with auto-generated ID

ADDPRO → Add a new product with auto-generated ID

ADDCUST → Add a new customer with auto-generated ID

ADDORDER → Add a new order with auto-generated ID and current date

👁️ Views

BillView → Provides a ready-to-use invoice with customer, product, and billing details

🎯 Learning Highlights

Database normalization and relational modeling

Use of stored procedures and functions for automation

Constraints for ensuring data integrity

Views for reporting and billing