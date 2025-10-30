-- Cars4U Database Schema
CREATE DATABASE IF NOT EXISTS cars4u;
USE cars4u;

-- =========================
-- Table: Location
-- =========================
CREATE TABLE Location (
  LocationID INT PRIMARY KEY AUTO_INCREMENT,
  LocationName VARCHAR(100) NOT NULL,
  Address VARCHAR(200) NOT NULL
);

-- =========================
-- Table: CarClass
-- =========================
CREATE TABLE CarClass (
  ClassID INT PRIMARY KEY AUTO_INCREMENT,
  ClassName VARCHAR(50) NOT NULL,
  DailyRate DECIMAL(10,2) CHECK (DailyRate >= 0),
  WeeklyRate DECIMAL(10,2) CHECK (WeeklyRate >= 0),
  MonthlyRate DECIMAL(10,2) CHECK (MonthlyRate >= 0)
);

-- =========================
-- Table: Car
-- =========================
CREATE TABLE Car (
  CarID INT PRIMARY KEY AUTO_INCREMENT,
  VIN VARCHAR(17) UNIQUE NOT NULL,
  LicensePlate VARCHAR(10) UNIQUE NOT NULL,
  Make VARCHAR(50) NOT NULL,
  Model VARCHAR(50) NOT NULL,
  YearMade SMALLINT CHECK (YearMade >= 1980),
  Colour VARCHAR(30),
  Mileage INT CHECK (Mileage >= 0),
  ClassID INT NOT NULL,
  CurrentLocationID INT NOT NULL,
  FOREIGN KEY (ClassID) REFERENCES CarClass(ClassID),
  FOREIGN KEY (CurrentLocationID) REFERENCES Location(LocationID)
);

-- =========================
-- Table: Customer
-- =========================
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(200),
  Phone VARCHAR(20),
  LicenceNo VARCHAR(20) UNIQUE
);

-- =========================
-- Table: Employee
-- =========================
CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(200),
  Phone VARCHAR(20),
  Role ENUM('Driver','Cleaner','Admin','Manager') NOT NULL,
  LicenceNo VARCHAR(20),
  LocationID INT NOT NULL,
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- =========================
-- Table: Rental
-- =========================
CREATE TABLE Rental (
  RentalID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  CarID INT NOT NULL,
  PickupLocationID INT NOT NULL,
  DropoffLocationID INT NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  StartMileage INT CHECK (StartMileage >= 0),
  EndMileage INT CHECK (EndMileage >= 0),
  FuelReturn ENUM('Empty','Quarter','Half','ThreeQuarters','Full') DEFAULT 'Full',
  TotalPrice DECIMAL(10,2),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (CarID) REFERENCES Car(CarID),
  FOREIGN KEY (PickupLocationID) REFERENCES Location(LocationID),
  FOREIGN KEY (DropoffLocationID) REFERENCES Location(LocationID)
);

-- =========================
-- Table: Promotion
-- =========================
CREATE TABLE Promotion (
  PromoID INT PRIMARY KEY AUTO_INCREMENT,
  ClassID INT NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  DiscountPercent DECIMAL(5,2) CHECK (DiscountPercent >= 0 AND DiscountPercent <= 100),
  FOREIGN KEY (ClassID) REFERENCES CarClass(ClassID)
);

-- =========================
-- Table: DropoffCharge
-- =========================
CREATE TABLE DropoffCharge (
  DropoffID INT PRIMARY KEY AUTO_INCREMENT,
  ClassID INT NOT NULL,
  PickupLocationID INT NOT NULL,
  DropoffLocationID INT NOT NULL,
  ChargeAmount DECIMAL(10,2) CHECK (ChargeAmount >= 0),
  FOREIGN KEY (ClassID) REFERENCES CarClass(ClassID),
  FOREIGN KEY (PickupLocationID) REFERENCES Location(LocationID),
  FOREIGN KEY (DropoffLocationID) REFERENCES Location(LocationID)
);
