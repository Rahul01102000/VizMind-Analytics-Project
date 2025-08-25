CREATE DATABASE INVENTORY;
USE INVENTORY;
CREATE TABLE SUPPLIER (
    SID VARCHAR(10) NOT NULL PRIMARY KEY,  -- Format S0001
    SNAME VARCHAR(100) NOT NULL,           -- Supplier Name, Not Null
    SADD VARCHAR(255) NOT NULL,            -- Supplier Address, Not Null
    SCITY VARCHAR(50) DEFAULT 'DELHI',     -- Default city is DELHI
    SPHONE VARCHAR(15) UNIQUE,             -- Unique phone number
    EMAIL VARCHAR(100)                     -- Email address
);
CREATE TABLE PRODUCT (
    PID VARCHAR(10) NOT NULL PRIMARY KEY,  -- Format P0001
    PDESC VARCHAR(255) NOT NULL,           -- Product description, Not Null
    PRICE DECIMAL(10, 2) CHECK (PRICE > 0),-- Price should be greater than 0
    CATEGORY VARCHAR(2) CHECK (CATEGORY IN ('IT', 'HA', 'HC')),  -- Category restricted to 'IT', 'HA', 'HC'
    SID VARCHAR(10),                       -- Foreign Key to Supplier table
    FOREIGN KEY (SID) REFERENCES SUPPLIER(SID)  -- Foreign key constraint referencing SUPPLIER
);

CREATE TABLE STOCK (
    PID VARCHAR(10) NOT NULL,                    -- Product ID, Foreign Key
    SQTY INT CHECK (SQTY >= 0),                  -- Stock Quantity, must be >= 0
    ROL INT CHECK (ROL > 0),                     -- Reorder Level, must be > 0
    MOQ INT CHECK (MOQ >= 5),                    -- Minimum Order Quantity, must be >= 5
    FOREIGN KEY (PID) REFERENCES PRODUCT(PID)    -- Foreign Key to PRODUCT table
);
CREATE TABLE CUST (
    CID VARCHAR(10) NOT NULL PRIMARY KEY,        -- Format C0001
    CNAME VARCHAR(100) NOT NULL,                 -- Customer Name, Not Null
    ADDRESS VARCHAR(255) NOT NULL,               -- Address, Not Null
    CITY VARCHAR(50) NOT NULL,                   -- City, Not Null
    PHONE VARCHAR(15) NOT NULL,                  -- Phone Number, Not Null
    EMAIL VARCHAR(100) NOT NULL,                 -- Email, Not Null
    DOB DATE CHECK (DOB < '2000-01-01')     -- Date of Birth, must be before 1-Jan-2000
);
CREATE TABLE ORDERS (
    OID VARCHAR(10) NOT NULL PRIMARY KEY,       -- Order ID in format O0001
    ODATE DATE NOT NULL,                        -- Order Date
    PID VARCHAR(10) NOT NULL,                   -- Product ID, Foreign Key
    CID VARCHAR(10) NOT NULL,                   -- Customer ID, Foreign Key
    OQTY INT CHECK (OQTY >= 1),                 -- Order Quantity, must be >= 1
    FOREIGN KEY (PID) REFERENCES PRODUCT(PID),  -- Foreign Key to PRODUCT table
    FOREIGN KEY (CID) REFERENCES CUST(CID)      -- Foreign Key to CUST table
);
INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, EMAIL) VALUES
('S0001', 'Supplier One', '123 Supplier St', 'Delhi', '1111111111', 'supplier1@example.com'),
('S0002', 'Supplier Two', '456 Supplier St', 'Delhi', '2222222222', 'supplier2@example.com'),
('S0003', 'Supplier Three', '789 Supplier St', 'Delhi', '3333333333', 'supplier3@example.com'),
('S0004', 'Supplier Four', '101 Supplier St', 'Delhi', '4444444444', 'supplier4@example.com'),
('S0005', 'Supplier Five', '202 Supplier St', 'Delhi', '5555555555', 'supplier5@example.com'),
('S0006', 'Supplier Six', '303 Supplier St', 'Delhi', '6666666666', 'supplier6@example.com'),
('S0007', 'Supplier Seven', '404 Supplier St', 'Delhi', '7777777777', 'supplier7@example.com'),
('S0008', 'Supplier Eight', '505 Supplier St', 'Delhi', '8888888888', 'supplier8@example.com'),
('S0009', 'Supplier Nine', '606 Supplier St', 'Delhi', '9999999999', 'supplier9@example.com'),
('S0010', 'Supplier Ten', '707 Supplier St', 'Delhi', '1010101010', 'supplier10@example.com');
INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) VALUES
('P0001', 'Product One', 100.00, 'IT', 'S0001'),
('P0002', 'Product Two', 150.00, 'HA', 'S0002'),
('P0003', 'Product Three', 200.00, 'HC', 'S0003'),
('P0004', 'Product Four', 250.00, 'IT', 'S0004'),
('P0005', 'Product Five', 300.00, 'HA', 'S0005'),
('P0006', 'Product Six', 350.00, 'HC', 'S0006'),
('P0007', 'Product Seven', 400.00, 'IT', 'S0007'),
('P0008', 'Product Eight', 450.00, 'HA', 'S0008'),
('P0009', 'Product Nine', 500.00, 'HC', 'S0009'),
('P0010', 'Product Ten', 550.00, 'IT', 'S0010'),
('P0011', 'Product Eleven', 600.00, 'HA', 'S0001'),
('P0012', 'Product Twelve', 650.00, 'HC', 'S0002'),
('P0013', 'Product Thirteen', 700.00, 'IT', 'S0003'),
('P0014', 'Product Fourteen', 750.00, 'HA', 'S0004'),
('P0015', 'Product Fifteen', 800.00, 'HC', 'S0005');
INSERT INTO STOCK (PID, SQTY, ROL, MOQ) VALUES
('P0001', 10, 5, 5),
('P0002', 20, 10, 5),
('P0003', 30, 15, 5),
('P0004', 40, 20, 5),
('P0005', 50, 25, 5),
('P0006', 60, 30, 5),
('P0007', 70, 35, 5),
('P0008', 80, 40, 5),
('P0009', 90, 45, 5),
('P0010', 100, 50, 5),
('P0011', 110, 55, 5),
('P0012', 120, 60, 5),
('P0013', 130, 65, 5),
('P0014', 140, 70, 5),
('P0015', 150, 75, 5);
INSERT INTO CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB) VALUES
('C0001', 'Customer One', '111 Customer St', 'Delhi', '1234567890', 'customer1@example.com', '1995-01-01'),
('C0002', 'Customer Two', '222 Customer St', 'Delhi', '2345678901', 'customer2@example.com', '1998-05-05'),
('C0003', 'Customer Three', '333 Customer St', 'Delhi', '3456789012', 'customer3@example.com', '1992-03-03'),
('C0004', 'Customer Four', '444 Customer St', 'Delhi', '4567890123', 'customer4@example.com', '1985-07-07'),
('C0005', 'Customer Five', '555 Customer St', 'Delhi', '5678901234', 'customer5@example.com', '1990-11-11'),
('C0006', 'Customer Six', '666 Customer St', 'Delhi', '6789012345', 'customer6@example.com', '1989-12-12'),
('C0007', 'Customer Seven', '777 Customer St', 'Delhi', '7890123456', 'customer7@example.com', '1993-04-04'),
('C0008', 'Customer Eight', '888 Customer St', 'Delhi', '8901234567', 'customer8@example.com', '1994-08-08'),
('C0009', 'Customer Nine', '999 Customer St', 'Delhi', '9012345678', 'customer9@example.com', '1991-06-06'),
('C0010', 'Customer Ten', '000 Customer St', 'Delhi', '0123456789', 'customer10@example.com', '1996-02-02');
INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY) VALUES
('O0001', '2024-01-01', 'P0001', 'C0001', 2),
('O0002', '2024-01-02', 'P0002', 'C0002', 3),
('O0003', '2024-01-03', 'P0003', 'C0003', 1),
('O0004', '2024-01-04', 'P0004', 'C0004', 5),
('O0005', '2024-01-05', 'P0005', 'C0005', 4),
('O0006', '2024-01-06', 'P0006', 'C0006', 6),
('O0007', '2024-01-07', 'P0007', 'C0007', 2),
('O0008', '2024-01-08', 'P0008', 'C0008', 3),
('O0009', '2024-01-09', 'P0009', 'C0009', 1),
('O0010', '2024-01-10', 'P0010', 'C0010', 5);
CREATE VIEW BillView AS
SELECT 
    O.OID AS OrderID,               -- Order ID from ORDERS table
    O.ODATE AS OrderDate,           -- Order Date from ORDERS table
    C.CNAME AS CustomerName,        -- Customer Name from CUST table
    C.ADDRESS AS CustomerAddress,   -- Customer Address from CUST table
    C.PHONE AS CustomerPhone,       -- Customer Phone from CUST table
    P.PDESC AS ProductDescription,   -- Product Description from PRODUCT table
    P.PRICE AS ProductPrice,         -- Product Price from PRODUCT table
    O.OQTY AS OrderQuantity,         -- Order Quantity from ORDERS table
    (P.PRICE * O.OQTY) AS TotalAmount-- Calculated Total Amount
FROM 
    ORDERS O
JOIN 
    PRODUCT P ON O.PID = P.PID       -- Join to get product details
JOIN 
    CUST C ON O.CID = C.CID;         -- Join to get customer details

SELECT * FROM BillView;

CREATE PROCEDURE ADDSUPPLIER 
    @SID VARCHAR(10),
    @SNAME VARCHAR(100),
    @SADD VARCHAR(200),
    @SCITY VARCHAR(100),
    @SPHONE VARCHAR(15),
    @EMAIL VARCHAR(100)
AS
BEGIN
    INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, EMAIL)
    VALUES (@SID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);
    
    SELECT * FROM SUPPLIER WHERE SID = @SID;  -- Display the newly added supplier details
END;
CREATE PROCEDURE ADDPRO 
    @PID VARCHAR(10),
    @PDESC VARCHAR(100),
    @PRICE DECIMAL(10, 2),
    @CATEGORY VARCHAR(10),
    @SID VARCHAR(10)
AS
BEGIN
    INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID)
    VALUES (@PID, @PDESC, @PRICE, @CATEGORY, @SID);
    
    SELECT * FROM PRODUCT WHERE PID = @PID;  -- Display the newly added product details
END;
CREATE PROCEDURE ADDCUST 
    @CID VARCHAR(10),
    @CNAME VARCHAR(100),
    @ADDRESS VARCHAR(200),
    @CITY VARCHAR(100),
    @PHONE VARCHAR(15),
    @EMAIL VARCHAR(100),
    @DOB DATE
AS
BEGIN
    INSERT INTO CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB)
    VALUES (@CID, @CNAME, @ADDRESS, @CITY, @PHONE, @EMAIL, @DOB);
    
    SELECT * FROM CUST WHERE CID = @CID;  -- Display the newly added customer details
END;
CREATE PROCEDURE ADDORDER 
    @OID VARCHAR(10),
    @PID VARCHAR(10),
    @CID VARCHAR(10),
    @OQTY INT
AS
BEGIN
    DECLARE @CurrentDate DATE = GETDATE();  -- Get the current date
    
    INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
    VALUES (@OID, @CurrentDate, @PID, @CID, @OQTY);
    
    SELECT * FROM ORDERS WHERE OID = @OID;  -- Display the newly added order details
END;

EXEC ADDSUPPLIER 'S0011', 'Supplier ELEVEN', 'Supplier Address', 'Delhi', '1234567890',
 'supplier11@example.com';
EXEC ADDPRO 'P0016', 'Product SIXTEEN', 100.00, 'IT', 'S0001';
EXEC ADDCUST 'C0011', 'Customer ELEVEN', 'Customer Address', 'Delhi', '0987654321',
 'customer11@example.com', '1990-01-01';
EXEC ADDORDER 'O0011', 'P0016', 'C0011', 2;

DELETE FROM SUPPLIER WHERE SID = 'S0011';
DELETE FROM PRODUCT WHERE PID = 'P0016';
DELETE FROM CUST WHERE CID = 'C0011';
DELETE FROM ORDERS WHERE OID = 'O0011';

SELECT * FROM SUPPLIER;
SELECT * FROM CUST;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERS;

CREATE FUNCTION GenerateID
(
    @Prefix CHAR(1),
    @Number INT
)
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @GeneratedID VARCHAR(5);
    
    -- Concatenate the prefix with the number padded to 4 digits
    SET @GeneratedID = @Prefix + RIGHT('0000' + CAST(@Number AS VARCHAR(4)), 4);
    
    RETURN @GeneratedID;
END;
-- Sequence for Supplier IDs
CREATE SEQUENCE SupplierSeq
START WITH 1  -- Start from the next value based on current max SID
INCREMENT BY 1;

-- Sequence for Product IDs
CREATE SEQUENCE ProductSeq
START WITH 1  -- Start from the next value based on current max PID
INCREMENT BY 1;

-- Sequence for Customer IDs
CREATE SEQUENCE CustomerSeq
START WITH 1  -- Start from the next value based on current max CID
INCREMENT BY 1;

-- Sequence for Order IDs
CREATE SEQUENCE OrderSeq
START WITH 1  -- Start from the next value based on current max OID
INCREMENT BY 1;

ALTER PROCEDURE ADDSUPPLIER 
    @SNAME VARCHAR(100),
    @SADD VARCHAR(200),
    @SCITY VARCHAR(100),
    @SPHONE VARCHAR(15),
    @EMAIL VARCHAR(100)
AS
BEGIN
    DECLARE @SID VARCHAR(5);  -- Declare the variable for Supplier ID
    DECLARE @nextID INT;

    -- Get the next number from the sequence
    SELECT @nextID = NEXT VALUE FOR SupplierSeq;

    -- Generate new Supplier ID
    SET @SID = dbo.GenerateID('S', @nextID);

    -- Insert the new Supplier with auto-generated ID
    INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, EMAIL)
    VALUES (@SID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);

    -- Display the newly added Supplier details
    SELECT * FROM SUPPLIER WHERE SID = @SID;
END;
ALTER PROCEDURE ADDPRO 
    @PDESC VARCHAR(100),
    @PRICE DECIMAL(10, 2),
    @CATEGORY VARCHAR(10),
    @SID VARCHAR(10)
AS
BEGIN
    DECLARE @PID VARCHAR(5);  -- Declare the variable for Product ID
    DECLARE @nextID INT;

    -- Get the next number from the sequence
    SELECT @nextID = NEXT VALUE FOR ProductSeq;

    -- Generate new Product ID
    SET @PID = dbo.GenerateID('P', @nextID);

    -- Insert the new Product with auto-generated ID
    INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID)
    VALUES (@PID, @PDESC, @PRICE, @CATEGORY, @SID);

    -- Display the newly added Product details
    SELECT * FROM PRODUCT WHERE PID = @PID;
END;
ALTER PROCEDURE ADDCUST 
    @CNAME VARCHAR(100),
    @ADDRESS VARCHAR(200),
    @CITY VARCHAR(100),
    @PHONE VARCHAR(15),
    @EMAIL VARCHAR(100),
    @DOB DATE
AS
BEGIN
    DECLARE @CID VARCHAR(5);  -- Declare the variable for Customer ID
    DECLARE @nextID INT;

    -- Get the next number from the sequence
    SELECT @nextID = NEXT VALUE FOR CustomerSeq;

    -- Generate new Customer ID
    SET @CID = dbo.GenerateID('C', @nextID);

    -- Insert the new Customer with auto-generated ID
    INSERT INTO CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB)
    VALUES (@CID, @CNAME, @ADDRESS, @CITY, @PHONE, @EMAIL, @DOB);

    -- Display the newly added Customer details
    SELECT * FROM CUST WHERE CID = @CID;
END;
ALTER PROCEDURE ADDORDER 
    @PID VARCHAR(10),
    @CID VARCHAR(10),
    @OQTY INT
AS
BEGIN
    DECLARE @OID VARCHAR(5);  -- Declare the variable for Order ID
    DECLARE @CurrentDate DATE = GETDATE();  -- Get the current date
    DECLARE @nextID INT;

    -- Get the next number from the sequence
    SELECT @nextID = NEXT VALUE FOR OrderSeq;

    -- Generate new Order ID
    SET @OID = dbo.GenerateID('O', @nextID);

    -- Insert the new Order with auto-generated ID and current date
    INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
    VALUES (@OID, @CurrentDate, @PID, @CID, @OQTY);

    -- Display the newly added Order details
    SELECT * FROM ORDERS WHERE OID = @OID;
END;
EXEC ADDSUPPLIER 'Supplier Name', 'Supplier Address', 'Delhi', '1234567890', 'supplier@example.com';
EXEC ADDPRO 'Product Description', 100.00, 'IT', 'S0001';
EXEC ADDCUST 'Customer Name', 'Customer Address', 'Delhi', '0987654321', 'customer@example.com', '1990-01-01';
EXEC ADDORDER 'P0001', 'C0001', 2;

EXEC ADDSUPPLIER  'Supplier ELEVEN', 'Supplier Address', 'Delhi', '7389727378',
 'supplier11@example.com';
EXEC ADDPRO  'Product SIXTEEN', 100.00, 'IT', 'S0001';
EXEC ADDCUST 'C0011', 'Customer ELEVEN', 'Customer Address', 'Delhi', '0987654321',
 'customer11@example.com', '1990-01-01';
EXEC ADDORDER 'O0011', 'P0016', 'C0011', 2;

DELETE FROM SUPPLIER WHERE SID = 'S0011';
DELETE FROM PRODUCT WHERE PID = 'P0016';
DELETE FROM CUST WHERE CID = 'C0011';
DELETE FROM ORDERS WHERE OID = 'O0011';

SELECT * FROM SUPPLIER;
SELECT * FROM CUST;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERS;

ALTER PROCEDURE ADDSUPPLIER 
    @SNAME VARCHAR(100),
    @SADD VARCHAR(200),
    @SCITY VARCHAR(100),
    @SPHONE VARCHAR(15),
    @EMAIL VARCHAR(100)
AS
BEGIN
    DECLARE @SID VARCHAR(5);  -- Declare the variable for Supplier ID

    -- Get the next number for Supplier ID based on the current max value
    DECLARE @nextID INT;
    SELECT @nextID = ISNULL(MAX(CAST(SUBSTRING(SID, 2, 4) AS INT)), 0) + 1 FROM SUPPLIER;

    -- Generate new Supplier ID
    SET @SID = dbo.GenerateID('S', @nextID);

    -- Insert the new Supplier with auto-generated ID
    INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, EMAIL)
    VALUES (@SID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);

    -- Display the newly added Supplier details
    SELECT * FROM SUPPLIER WHERE SID = @SID;
END;

ALTER PROCEDURE ADDPRO 
    @PDESC VARCHAR(100),
    @PRICE DECIMAL(10, 2),
    @CATEGORY VARCHAR(10),
    @SID VARCHAR(10)
AS
BEGIN
    DECLARE @PID VARCHAR(5);  -- Declare the variable for Product ID

    -- Get the next number for Product ID based on the current max value
    DECLARE @nextID INT;
    SELECT @nextID = ISNULL(MAX(CAST(SUBSTRING(PID, 2, 4) AS INT)), 0) + 1 FROM PRODUCT;

    -- Generate new Product ID
    SET @PID = dbo.GenerateID('P', @nextID);

    -- Insert the new Product with auto-generated ID
    INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID)
    VALUES (@PID, @PDESC, @PRICE, @CATEGORY, @SID);

    -- Display the newly added Product details
    SELECT * FROM PRODUCT WHERE PID = @PID;
END;
ALTER PROCEDURE ADDCUST 
    @CNAME VARCHAR(100),
    @ADDRESS VARCHAR(200),
    @CITY VARCHAR(100),
    @PHONE VARCHAR(15),
    @EMAIL VARCHAR(100),
    @DOB DATE
AS
BEGIN
    DECLARE @CID VARCHAR(5);  -- Declare the variable for Customer ID

    -- Get the next number for Customer ID based on the current max value
    DECLARE @nextID INT;
    SELECT @nextID = ISNULL(MAX(CAST(SUBSTRING(CID, 2, 4) AS INT)), 0) + 1 FROM CUST;

    -- Generate new Customer ID
    SET @CID = dbo.GenerateID('C', @nextID);

    -- Insert the new Customer with auto-generated ID
    INSERT INTO CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB)
    VALUES (@CID, @CNAME, @ADDRESS, @CITY, @PHONE, @EMAIL, @DOB);

    -- Display the newly added Customer details
    SELECT * FROM CUST WHERE CID = @CID;
END;
ALTER PROCEDURE ADDORDER 
    @PID VARCHAR(10),
    @CID VARCHAR(10),
    @OQTY INT
AS
BEGIN
    DECLARE @OID VARCHAR(5);  -- Declare the variable for Order ID
    DECLARE @CurrentDate DATE = GETDATE();  -- Get the current date
    
    -- Get the next number for Order ID based on the current max value
    DECLARE @nextID INT;
    SELECT @nextID = ISNULL(MAX(CAST(SUBSTRING(OID, 2, 4) AS INT)), 0) + 1 FROM ORDERS;

    -- Generate new Order ID
    SET @OID = dbo.GenerateID('O', @nextID);

    -- Insert the new Order with auto-generated ID and current date
    INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
    VALUES (@OID, @CurrentDate, @PID, @CID, @OQTY);

    -- Display the newly added Order details
    SELECT * FROM ORDERS WHERE OID = @OID;
END;

EXEC ADDSUPPLIER 'Supplier Name', 'Supplier Address', 'Delhi', '1234567890', 'supplier@example.com';
EXEC ADDPRO 'Product Description', 100.00, 'IT', 'S0001';
EXEC ADDCUST 'Customer Name', 'Customer Address', 'Delhi', '0987654321', 'customer@example.com', '1990-01-01';
EXEC ADDORDER 'P0001', 'C0001', 2;

EXEC ADDSUPPLIER  'Supplier ELEVEN', 'Supplier Address', 'Delhi', '7389727378',
 'supplier11@example.com';
EXEC ADDPRO  'Product SIXTEEN', 100.00, 'IT', 'S0001';
EXEC ADDCUST 'C0011', 'Customer ELEVEN', 'Customer Address', 'Delhi', '0987654321',
 'customer11@example.com', '1990-01-01';
EXEC ADDORDER 'O0011', 'P0016', 'C0011', 2;

DELETE FROM SUPPLIER WHERE SID = 'S0011';
DELETE FROM PRODUCT WHERE PID = 'P0016';
DELETE FROM CUST WHERE CID = 'C0011';
DELETE FROM ORDERS WHERE OID = 'O0011';

SELECT * FROM SUPPLIER;
SELECT * FROM CUST;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERS;


















