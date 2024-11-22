DROP DATABASE IF EXISTS CarDealershipDB;
CREATE DATABASE CarDealershipDB;
USE CarDealershipDB;

-- Table 1
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(12) NOT NULL
);


-- Taable 2 
CREATE TABLE vehicles( 
    Vin VARCHAR(30) PRIMARY KEY,
    `Year` DATE NOT NULL,
    Make VARCHAR(20) NOT NULL,
    Model VARCHAR(20) NOT NULL,
    VehicleType VARCHAR(20),
    Color VARCHAR(20),
    Odometer INT NOT NULL,
    Price FLOAT NOT NULL,
    Sold BOOLEAN
);

-- Table 3
CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    vin VARCHAR(30) NOT NULL,
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Table 4

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(30) NOT NULL,
    salesTaxAmount FLOAT NOT NULL,
    recordingFee FLOAT NOT NULL,
    processingFee FLOAT NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Table 5
CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(30) NOT NULL,
    expectedEndingValue FLOAT NOT NULL,
    leaseFee FLOAT NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);



