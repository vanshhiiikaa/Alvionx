SELECT 
    CustomerID AS Customer_ID,
    CustomerName AS Customer_Name,
    City AS City_Name,
    Region AS Region_Name,
    SignupDate AS Signup_Date
FROM Customers
WHERE CustomerName LIKE 'S%' 
  AND City = 'Lucknow';