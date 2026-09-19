SELECT o.*, c.Region 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Amount > 15000 
  AND c.Region = 'North'
ORDER BY o.Amount DESC;
