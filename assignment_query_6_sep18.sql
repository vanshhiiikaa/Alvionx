-- QUESTION1: Who are top 5 customers by Average spends?
SELECT
    c.CustomerID,
    c.CustomerName,
    AVG(o.Amount) AS Average_Spend
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY Average_Spend DESC
LIMIT 5;

-- QUESTION2: Which region has the highest Total Order Value?
SELECT
    Region,
    SUM(Amount) AS Total_Order_Value
FROM Orders
GROUP BY Region
ORDER BY Total_Order_Value DESC
LIMIT 1;

-- QUESTION3: Which customers have never placed an order?
SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

-- QUESTION4: Which product category is most popular in each region?
WITH CategoryCounts AS (
    SELECT
        Region,
        ProductCategory,
        COUNT(*) AS Order_Count
    FROM Orders
    GROUP BY
        Region,
        ProductCategory
),
RankedCategories AS (
    SELECT
        Region,
        ProductCategory,
        Order_Count,
        RANK() OVER (
            PARTITION BY Region
            ORDER BY Order_Count DESC
        ) AS Rank_
    FROM CategoryCounts
)
SELECT
    Region,
    ProductCategory,
    Order_Count
FROM RankedCategories
WHERE Rank_ = 1
ORDER BY Region;
