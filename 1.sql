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

-- POPULATING

INSERT INTO dealerships (`name`, `address`, `phone`)
VALUES 
('Spuddy Buddy Motors', '1234 Tater Blvd, Idaho Falls, ID, 83401', '208-555-TATER'),
('Mash It Auto', '5678 Buttered St, Bakersfield, CA, 93301', '661-555-MASH'),
('The Fry Guy', '4321 Crispy Ave, French Fry, LA, 90001', '323-555-FRY1'),
('Peel & Drive', '8765 Spud Rd, Boise, ID, 83702', '208-555-PEEL'),
('The Potato Pit Stop', '9876 Starchy Way, Potato Grove, IA, 52556', '515-555-1234'),
('Yukon Gold Cars', '1357 Golden Tater Ln, Anchorage, AK, 99501', '907-555-5555'),
('Tater Tot Autos', '2468 Fryer Blvd, Sweet Potato City, OK, 73102', '405-555-TOT1'),
('Smashed Wheels', '3690 Potato Patch Rd, Mashville, TN, 37201', '615-555-SMAS'),
('Spudtacular Motors', '4820 Baked St, Russet, UT, 84101', '385-555-SPUD'),
('Hot Potato Motors', '5790 Spud Circle, Frytown, TX, 75201', '214-555-HOT1');



