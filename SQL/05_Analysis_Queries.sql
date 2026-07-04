/*
Customer Retention Analysis Project
SQL Analysis Queries
====================================================
Purpose:
Business analysis queries created after loading
customer retention data into SQL Server.
====================================================
Skills demonstrated:
- SELECT statements
- Aggregations
- GROUP BY
- JOINs
- CASE statements
- Subqueries
- CTEs
- Window Functions
====================================================
*/

USE CustomerRetentionAnalysis;

/*
====================================================
SECTION 1: CUSTOMER OVERVIEW ANALYSIS
====================================================
*/

-- Query 1:
-- Total number of customers available in the database

SELECT 
    COUNT(*) AS TotalCustomers
FROM DimCustomer;

-- Query 2:
-- Customer distribution by gender

SELECT
    Gender,
    COUNT(*) AS CustomerCount
FROM DimCustomer
GROUP BY Gender
ORDER BY CustomerCount DESC;

-- Query 3:
-- Customer distribution by state

SELECT
    State,
    COUNT(*) AS CustomerCount
FROM DimCustomer
GROUP BY State
ORDER BY CustomerCount DESC;

/*
====================================================
SECTION 2: CHURN ANALYSIS
====================================================
*/


-- Query 4:
-- Calculate churn status count and percentage
SELECT
    CustomerStatus,
    COUNT(*) AS CustomerCount,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM FactRetention),
        2
    ) AS Percentage
FROM FactRetention
GROUP BY CustomerStatus;

-- Query 5:
-- Identify most common churn reasons

SELECT
    ChurnReason,
    COUNT(*) AS CustomersLost
FROM FactRetention
WHERE CustomerStatus = 'Churned'
GROUP BY ChurnReason
ORDER BY CustomersLost DESC;

-- Query 6:
-- Analyze customers by churn risk level

SELECT
    ChurnRisk,
    COUNT(*) AS CustomerCount
FROM FactRetention
GROUP BY ChurnRisk
ORDER BY CustomerCount DESC;

/*
====================================================
SECTION 3: REVENUE ANALYSIS
====================================================
*/


-- Query 7:
-- Total revenue generated

SELECT
    SUM(TotalRevenue) AS TotalRevenue
FROM FactRevenue;

-- Query 8:
-- Revenue comparison between churned and retained customers

SELECT
    r.CustomerStatus,
    SUM(rv.TotalRevenue) AS Revenue
FROM FactRetention r
JOIN FactRevenue rv
ON r.CustomerID = rv.CustomerID
GROUP BY r.CustomerStatus
ORDER BY Revenue DESC;

-- Query 9:
-- Average revenue per customer

SELECT
    AVG(TotalRevenue) AS AverageRevenuePerCustomer
FROM FactRevenue;

/*
====================================================
SECTION 4: CUSTOMER VALUE ANALYSIS
====================================================
*/


-- Query 10:
-- Top 10 customers based on lifetime value

SELECT TOP 10
    CustomerID,
    CLTV
FROM FactRetention
ORDER BY CLTV DESC;

-- Query 11:
-- Customer segment distribution

SELECT
    CustomerSegment,
    COUNT(*) AS CustomerCount
FROM FactRetention
GROUP BY CustomerSegment
ORDER BY CustomerCount DESC;

/*
====================================================
SECTION 5: ADVANCED SQL ANALYSIS
====================================================
*/


-- Query 12:
-- Rank customers based on revenue
-- Demonstrates window function
SELECT
    CustomerID,
    TotalRevenue,
    RANK() OVER
    (
        ORDER BY TotalRevenue DESC
    ) AS RevenueRank
FROM FactRevenue;


--Query 13:
--CTE Example:
--Find customers with high monthly charges


WITH HighValueCustomers AS
(
    SELECT
        CustomerID,
        MonthlyCharges,
        Contract,
        InternetService,
        PaymentMethod
    FROM DimSubscription
    WHERE MonthlyCharges > 80
)

SELECT *
FROM HighValueCustomers
ORDER BY MonthlyCharges DESC;

/*
====================================================
SECTION 6: ADVANCED CUSTOMER ANALYSIS
====================================================
*/


--Query 14:
--Rank customers based on total revenue

/*
Demonstrates:
- Window Function
- RANK()
- Business ranking analysis
*/

SELECT
    CustomerID,
    TotalRevenue,
    RANK() OVER
    (
        ORDER BY TotalRevenue DESC
    ) AS RevenueRank
FROM FactRevenue;


--Query 15:
--Revenue analysis by contract type

/*
Demonstrates:
- JOIN
- GROUP BY
- SUM aggregation
*/

SELECT
    s.Contract,
    SUM(r.TotalRevenue) AS TotalRevenue
FROM DimSubscription s
JOIN FactRevenue r
ON s.CustomerID = r.CustomerID
GROUP BY s.Contract
ORDER BY TotalRevenue DESC;