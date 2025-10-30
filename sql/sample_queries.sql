-- Show all active rentals (not yet returned)
SELECT * FROM Rental WHERE EndDate >= CURDATE();

-- Cars currently rented out
SELECT C.Make, C.Model
FROM Car C
WHERE C.CarID IN (SELECT CarID FROM Rental WHERE EndDate >= CURDATE());

-- Customers with bookings in the last 30 days
SELECT DISTINCT CU.Name, CU.Phone
FROM Customer CU
JOIN Rental R ON CU.CustomerID = R.CustomerID
WHERE R.StartDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Total revenue per month
SELECT DATE_FORMAT(StartDate, '%Y-%m') AS Month, SUM(TotalPrice) AS Revenue
FROM Rental
GROUP BY Month
ORDER BY Month DESC;

-- Most popular car class
SELECT CC.ClassName, COUNT(R.RentalID) AS TotalRentals
FROM Rental R
JOIN Car C ON R.CarID = C.CarID
JOIN CarClass CC ON C.ClassID = CC.ClassID
GROUP BY CC.ClassName
ORDER BY TotalRentals DESC
LIMIT 1;
