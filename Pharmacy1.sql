-- Switch to the Pharmacy1 database

USE Pharmacy1;

-- Create the Pharmacy_ table to store information about pharmacies

CREATE TABLE Pharmacy_ (
    PharmacyID INT PRIMARY KEY,           
    PharmacyName VARCHAR(255) NOT NULL,  
    Address VARCHAR(255) NOT NULL,        
    PhoneNumber VARCHAR(15) NOT NULL,     
    Email VARCHAR(255) NOT NULL UNIQUE    
);

-- Insert records into the Pharmacy_ table

INSERT INTO Pharmacy_ (PharmacyID, PharmacyName, Address, PhoneNumber, Email)
VALUES
    
    (1, 'Dvago', 'Bahawalpur', '03347701176', 'contact@Dvago.com'),
    (2, 'Caring Pharmacy', 'Bahawalpur', '03357709840', 'contact@Caring.com'),
	(3, 'HealthMart', 'Lahore', '03451237890', 'Contact@HealthMart.com'),
    (4, 'LifePharmacy', 'Karachi', '03009876543', '	Contact@LifePharmacy.com');

    
	-- Select all records from the Supplier_ table to verify insertion

	SELECT *
	FROM Pharmacy_;

-- Create the Supplier_ table to store information about suppliers

CREATE TABLE Supplier_ (
    SupplierID INT PRIMARY KEY,           
    SupplierName VARCHAR(255) NOT NULL,   
    ContactNumber VARCHAR(15),            
    Address VARCHAR(255)                 
);

-- Insert records into the Supplier_ table

INSERT INTO Supplier_ (SupplierID, SupplierName, ContactNumber, Address)
VALUES
    
    (1, 'PharmaCorp', '03337689090', 'Bahawalpur'),
    (2, 'HealthPharma', '03357709876', 'Bahawalpur'),
	(3, 'MedSupply', '03451234567', 'Lahore'),
    (4, 'BioMedics', '03009876543', 'Karachi');

-- Select all records from the Supplier_ table to verify insertion

SELECT * 
FROM Supplier_;

-- Create the Medicine_ table to store information about medicines

CREATE TABLE Medicine_ (
    MedicineID INT PRIMARY KEY,           
    PharmacyID INT,                       
    SupplierID INT,                       
    MedicineName VARCHAR(255) NOT NULL,   
    Brand VARCHAR(255),                    
    Price DECIMAL(10, 2) NOT NULL,        
    QuantityInStock INT NOT NULL,         
    ExpiryDate DATE,                      
    CONSTRAINT FK_Pharmacy_ FOREIGN KEY (PharmacyID) REFERENCES Pharmacy_(PharmacyID),  
    CONSTRAINT FK_Supplier_ FOREIGN KEY (SupplierID) REFERENCES Supplier_(SupplierID)   
);

-- Insert records into the Medicine_ table

INSERT INTO Medicine_ (MedicineID, PharmacyID, SupplierID, MedicineName, Brand, Price, QuantityInStock, ExpiryDate)
VALUES

    (1, 1, 1, 'Aspirin', 'Bayer', 5.99, 100, '2025-12-31'),
    (2, 1, 2, 'Tylenol', 'Acetaminophen', 6.49, 200, '2024-11-30'),
    (3, 2, 1, 'Ibuprofen', 'Advil', 4.99, 150, '2026-05-20'),
	(4, 2, 2, 'brufun', 'Motrin', 5.99, 150, '2026-05-10'),
	(5, 3, 3, 'Paracetamol', 'Panadol', 3.99, 120, '2025-08-15'),
    (6, 3, 2, 'Naproxen', 'Aleve', 7.49, 180, '2024-10-01'),
    (7, 4, 4, 'Cetirizine', 'Zyrtec', 8.99, 90, '2026-07-25');

-- Select all records from the Medicine_ table to verify insertion

SELECT *
FROM Medicine_;

 --Update record from Medicine
 
UPDATE Medicine_
SET Price = 5.99
WHERE MedicineID =4;
 --Delete record from Medicine
DELETE FROM Medicine_
WHERE MedicineID = 1;

 --implementation of inner join on pharmacy and medicine table
SELECT Pharmacy_.PharmacyName, Medicine_.MedicineName, Medicine_.Price
FROM Pharmacy_
INNER JOIN Medicine_ ON Pharmacy_.PharmacyID = Medicine_.PharmacyID;

 --implementation of inner join on Supplier and medicine table

SELECT Supplier_.SupplierName,Medicine_.MedicineName
 FROM Supplier_
 INNER JOIN Medicine_ ON Supplier_.SupplierID =Medicine_.MedicineID;

