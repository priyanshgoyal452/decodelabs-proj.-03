CREATE DATABASE RetailSalesDB;
GO

USE RetailSalesDB;
---Verify Data
SELECT * FROM [dbo].[cleaned_dataset];

---Total Records
SELECT COUNT(*) AS TotalOrders
FROM [dbo].[cleaned_dataset];

---Total Revenue
SELECT SUM(TotalPrice) AS TotalRevenue
FROM [dbo].[cleaned_dataset];

---Average Order Value
SELECT AVG(TotalPrice) AS AverageOrderValue
FROM [dbo].[cleaned_dataset];

---Highest Order
SELECT MAX(TotalPrice) AS HighestOrder
FROM [dbo].[cleaned_dataset];

---Lowest Order
SELECT MIN(TotalPrice) AS LowestOrder
FROM [dbo].[cleaned_dataset];

---Top Selling Products
SELECT Product,
       COUNT(*) AS TotalOrders
FROM [dbo].[cleaned_dataset]
GROUP BY Product
ORDER BY TotalOrders DESC;

---Revenue by Product
SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM [dbo].[cleaned_dataset]
GROUP BY Product
ORDER BY Revenue DESC;

---Orders by Payment Method
SELECT PaymentMethod,
       COUNT(*) AS Orders
FROM [dbo].[cleaned_dataset]
GROUP BY PaymentMethod
ORDER BY Orders DESC;

---Revenue by Payment Method
SELECT PaymentMethod,
       SUM(TotalPrice) AS Revenue
FROM [dbo].[cleaned_dataset]
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

---Order Status Distribution
SELECT OrderStatus,
       COUNT(*) AS Orders
FROM [dbo].[cleaned_dataset]
GROUP BY OrderStatus;

---Revenue by Order Status
SELECT OrderStatus,
       SUM(TotalPrice) AS Revenue
FROM [dbo].[cleaned_dataset]
GROUP BY OrderStatus;

---Orders Without Coupon
SELECT COUNT(*) AS OrdersWithoutCoupon
FROM [dbo].[cleaned_dataset]
WHERE CouponCode = 'No Coupon Used';

---Orders Using Coupons
SELECT CouponCode,
       COUNT(*) AS Orders
FROM [dbo].[cleaned_dataset]
GROUP BY CouponCode
ORDER BY Orders DESC;

---Products Sold
SELECT Product,
       SUM(Quantity) AS QuantitySold
FROM [dbo].[cleaned_dataset]
GROUP BY Product
ORDER BY QuantitySold DESC;

---Highest Value Orders
SELECT TOP 10 *
FROM [dbo].[cleaned_dataset]
ORDER BY TotalPrice DESC;