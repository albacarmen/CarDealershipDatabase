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

INSERT INTO vehicles (Vin, `Year`, Make, Model, VehicleType, Color, Odometer, Price, Sold)
VALUES
('JH4DC4310HS000001', '1988-05-12', 'Honda', 'Prelude', 'Coupe', 'Red', 120000, 4000.00, FALSE),
('JNKAY01F68M000002', '1988-09-09', 'Nissan', '300ZX', 'Coupe', 'Black', 110000, 5000.00, TRUE),
('JHMFA3620KS000003', '1989-03-01', 'Honda', 'Civic', 'Sedan', 'Blue', 130000, 3500.00, FALSE),
('1J4FY19P5BP000004', '1987-06-21', 'Toyota', 'Land Cruiser', 'SUV', 'White', 150000, 8000.00, TRUE),
('JN1CV6EK5DM000005', '1987-07-04', 'Nissan', 'Maxima', 'Sedan', 'Silver', 140000, 4000.00, FALSE),
('2T1AE00A1KC000006', '1989-12-13', 'Toyota', 'Corolla', 'Sedan', 'Red', 120000, 3000.00, TRUE),
('JHMNA1530NS000007', '1986-04-25', 'Honda', 'Accord', 'Sedan', 'Green', 160000, 4500.00, FALSE),
('JN8AZ1MW9DW000008', '1988-11-02', 'Nissan', 'Pathfinder', 'SUV', 'Gray', 170000, 6000.00, TRUE),
('4S3BMBK67A3000009', '1986-09-20', 'Mazda', '323', 'Hatchback', 'Blue', 140000, 2500.00, FALSE),
('1J4FY19P5BP000010', '1989-08-14', 'Toyota', '4Runner', 'SUV', 'Black', 135000, 7000.00, FALSE),
('JH4DB8550NS000011', '1986-01-03', 'Honda', 'Accord', 'Coupe', 'Silver', 150000, 4800.00, TRUE),
('2T1BR32E9LC000012', '1987-05-30', 'Toyota', 'Tercel', 'Hatchback', 'Yellow', 120000, 2800.00, FALSE),
('JN8AR5T1XFQ000013', '1989-07-15', 'Nissan', 'Sentra', 'Sedan', 'White', 110000, 3200.00, TRUE),
('JM1FB3313L0299999', '1987-10-10', 'Mazda', 'MX-6', 'Coupe', 'Red', 125000, 3900.00, FALSE),
('JNA1FNB05D700014', '1989-05-01', 'Nissan', '240SX', 'Coupe', 'Gray', 115000, 4600.00, FALSE),
('JH4DB8650NS000015', '1989-11-19', 'Honda', 'CRX', 'Coupe', 'White', 140000, 3500.00, TRUE),
('4S3BMBC67A3000016', '1989-02-22', 'Mazda', '929', 'Sedan', 'Black', 120000, 5000.00, TRUE);

INSERT INTO inventory (DealershipID, Vin)
VALUES
(1, 'JH4DC4310HS000001'),
(1, 'JNKAY01F68M000002'),
(2, 'JHMFA3620KS000003'),
(2, '1J4FY19P5BP000004'),
(3, 'JN1CV6EK5DM000005'),
(3, '2T1AE00A1KC000006'),
(4, 'JHMNA1530NS000007'),
(4, 'JN8AZ1MW9DW000008'),
(5, '4S3BMBK67A3000009'),
(5, '1J4FY19P5BP000010'),
(1, 'JH4DB8550NS000011'),
(2, '2T1BR32E9LC000012'),
(3, 'JN8AR5T1XFQ000013'),
(4, 'JM1FB3313L0299999'),
(5, 'JNA1FNB05D700014'),
(1, 'JH4DB8650NS000015'),
(2, '4S3BMBC67A3000016');

INSERT INTO sales_contracts (Vin, SalesTaxAmount, RecordingFee, ProcessingFee)
VALUES
('JH4DC4310HS000001', 250.00, 100.00, 150.00),
('JNKAY01F68M000002', 300.00, 120.00, 180.00),
('JHMFA3620KS000003', 250.00, 100.00, 150.00),
('1J4FY19P5BP000004', 400.00, 150.00, 200.00),
('JN1CV6EK5DM000005', 200.00, 80.00, 130.00);

INSERT INTO lease_contracts (Vin, ExpectedEndingValue, LeaseFee)
VALUES
('JH4DC4310HS000001', 5000.00, 300.00),
('JNKAY01F68M000002', 5500.00, 350.00),
('JHMFA3620KS000003', 4000.00, 250.00),
('1J4FY19P5BP000004', 6000.00, 400.00),
('JN1CV6EK5DM000005', 4500.00, 280.00);

-- get all dealerships
SELECT * FROM dealerships;

-- test by dealership
SELECT v.Vin, v.Year, v.Make, v.Model, v.VehicleType, v.Color, v.Odometer, v.Price, v.Sold
FROM vehicles v
JOIN inventory i ON v.Vin = i.vin
WHERE i.dealership_id = 1;

-- test by vin
SELECT * FROM vehicles
WHERE Vin = 'JH4DC4310HS000001';  -- Replace with the VIN you want to test

-- by_vin
SELECT d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.vin = 'JH4DC4310HS000001';  -- Replace with the VIN you want to test

-- by_car_type
SELECT d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.Make = 'Toyota' AND v.Model = 'Corolla' AND v.Color = 'Red';

-- by_date_range
SELECT sc.vin, sc.salesTaxAmount, sc.recordingFee, sc.processingFee
FROM sales_contracts sc
JOIN inventory i ON sc.vin = i.vin
WHERE i.dealership_id = 1  -- Specify dealership ID
AND sc.salesTaxAmount > 0  -- This is just an example filter; adjust as needed
AND sc.date >= '2023-01-01' AND sc.date <= '2023-12-31';  -- Specify your date range


