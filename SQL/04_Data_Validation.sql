USE CustomerRetentionAnalysis;

SELECT name AS TableName
FROM sys.tables
ORDER BY name;

SELECT 'DimCustomer' AS TableName, COUNT(*) AS RowsCount FROM DimCustomer
UNION ALL
SELECT 'DimSubscription', COUNT(*) FROM DimSubscription
UNION ALL
SELECT 'DimCustomerSatisfaction', COUNT(*) FROM DimCustomerSatisfaction
UNION ALL
SELECT 'FactRevenue', COUNT(*) FROM FactRevenue
UNION ALL
SELECT 'FactRetention', COUNT(*) FROM FactRetention;

SELECT COUNT(*) AS MatchingCustomers
FROM DimCustomer c
JOIN FactRevenue r
ON c.CustomerID = r.CustomerID;

SELECT TOP 5 * FROM DimCustomer;

SELECT TOP 5 * FROM DimSubscription;

SELECT TOP 5 * FROM DimCustomerSatisfaction;

SELECT TOP 5 * FROM FactRevenue;

SELECT TOP 5 * FROM FactRetention;

SELECT COUNT(*) AS MissingRevenueCustomers
FROM DimCustomer c
LEFT JOIN FactRevenue r
ON c.CustomerID = r.CustomerID
WHERE r.CustomerID IS NULL;