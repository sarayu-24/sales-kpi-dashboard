CREATE TABLE sales (
    Order_ID VARCHAR(10),
    Order_Date DATE,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(50),
    Quantity INT,
    Sales DECIMAL(10,2),
    Profit DECIMAL(10,2)
);

INSERT INTO sales VALUES
('O1001','2026-01-01','Laptop','Electronics','Hyderabad',2,120000,18000),
('O1002','2026-01-03','Mouse','Accessories','Chennai',5,5000,1500),
('O1003','2026-01-05','Keyboard','Accessories','Bangalore',3,7500,2100),
('O1004','2026-01-08','Monitor','Electronics','Hyderabad',2,30000,4500),
('O1005','2026-01-12','Printer','Electronics','Mumbai',1,18000,3000),
('O1006','2026-01-15','Laptop','Electronics','Chennai',1,60000,9000),
('O1007','2026-01-20','Headphones','Accessories','Bangalore',4,12000,3600),
('O1008','2026-01-25','Tablet','Electronics','Mumbai',2,50000,7000),
('O1009','2026-02-02','Laptop','Electronics','Bangalore',1,60000,9000),
('O1010','2026-02-06','Mouse','Accessories','Hyderabad',8,8000,2400),
('O1011','2026-02-10','Monitor','Electronics','Chennai',3,45000,6750),
('O1012','2026-02-14','Keyboard','Accessories','Mumbai',5,12500,3500),
('O1013','2026-02-18','Printer','Electronics','Hyderabad',2,36000,6000),
('O1014','2026-02-22','Tablet','Electronics','Bangalore',3,75000,10500),
('O1015','2026-02-27','Headphones','Accessories','Chennai',6,18000,5400);

-- Total KPIs
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(Order_ID) AS Total_Orders
FROM sales;

-- Sales by Region
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Sales by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 5 Products
SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 5;

-- Monthly Sales
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;

-- CTE
WITH region_sales AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Region
)
SELECT
    Region,
    Total_Sales
FROM region_sales
ORDER BY Total_Sales DESC;

-- Window Function
SELECT
    Product,
    Region,
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM sales;