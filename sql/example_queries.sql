-- 🔍 Preview a few rows from the cleaned dataset
SELECT TOP 10 * FROM dbo.sales_cleaned;

-- 📊 Total number of orders
SELECT COUNT(*) AS TotalOrders
FROM dbo.sales_cleaned;

-- 🧮 Orders by customer segment
SELECT Segment, COUNT(*) AS SegmentOrders
FROM dbo.sales_cleaned
GROUP BY Segment;

-- 🌍 Sales by country
SELECT Country, SUM(Sales) AS TotalSales
FROM dbo.sales_cleaned
GROUP BY Country
ORDER BY TotalSales DESC;

-- 🏆 Top 5 customers by total sales
SELECT CustomerID, SUM(Sales) AS TotalCustomerSales
FROM dbo.sales_cleaned
GROUP BY CustomerID
ORDER BY TotalCustomerSales DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 📦 Most sold product categories
SELECT Category, COUNT(*) AS TotalOrders
FROM dbo.sales_cleaned
GROUP BY Category
ORDER BY TotalOrders DESC;

-- 🕒 Average shipping time in days
SELECT AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS AvgShippingDays
FROM dbo.sales_cleaned;

-- 🧾 Total sales by region and segment
SELECT Region, Segment, SUM(Sales) AS TotalSales
FROM dbo.sales_cleaned
GROUP BY Region, Segment
ORDER BY Region, Segment;

-- 🧹 Detect NULLs in critical fields
SELECT *
FROM dbo.sales_cleaned
WHERE OrderID IS NULL OR OrderDate IS NULL OR Sales IS NULL;

-- 📈 Monthly sales trend (if dates are normalized)
SELECT FORMAT(OrderDate, 'yyyy-MM') AS Month, SUM(Sales) AS MonthlySales
FROM dbo.sales_cleaned
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Month;