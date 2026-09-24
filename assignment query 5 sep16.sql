-- Question1
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Orders;

SELECT
    Region,
    SUM(Amount) AS
Total_Revenue,
	COUNT(*) AS Number_of_Orders
FROM Orders
GROUP BY Region;

-- Question2
SELECT 
     ProductCategory,
     AVG(Amount) AS
Average_Order_Amount
FROM Orders
GROUP BY ProductCategory
Order BY AVG(Amount) DESC;

-- Question3
SELECT 
     Region,
     SUM(Amount) AS Total_Sales
FROM Orders
GROUP BY Region
HAVING SUM(Amount) > 500000;

-- Question4
SELECT
    ProductCategory,
    COUNT(*) AS Number_of_Orders
FROM Orders
WHERE OrderDate >= '2026-07-01'
   AND OrderDate < '2026-08-01'
GROUP BY ProductCategory
HAVING Count(*) > 50;