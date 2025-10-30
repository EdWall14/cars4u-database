# Cars4U Database Design

This project contains the logical and physical database design for the Cars4U car rental company.

## Contents
- `cars4u_schema.sql` – MySQL table creation script
- `ER_diagram.png` – Entity-Relationship Diagram
- `normalisation_notes.md` – explanation of normalisation steps
- `sample_queries.sql` – example analytical queries

CREATE TABLE Location (
  LocationID INT PRIMARY KEY AUTO_INCREMENT,
  LocationName VARCHAR(100),
  Address VARCHAR(200)
);


SELECT * FROM Rental WHERE EndDate >= CURDATE();

-- Show cars currently rented out
SELECT CarID, Make, Model FROM Car
WHERE CarID IN (SELECT CarID FROM Rental WHERE EndDate >= CURDATE());

-- Total revenue per month
SELECT DATE_FORMAT(StartDate, '%Y-%m') AS Month,
       SUM(TotalPrice) AS Revenue
FROM Rental
GROUP BY Month;


