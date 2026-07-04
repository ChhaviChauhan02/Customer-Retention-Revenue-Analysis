USE CustomerRetentionAnalysis;

BULK INSERT DimCustomer
FROM 'C:\Users\lav chauhan\OneDrive\Desktop\Chhavi\SQL_CustomerRetentionProject\csv files\Customer_SQL.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT DimSubscription
FROM 'C:\Users\lav chauhan\OneDrive\Desktop\Chhavi\SQL_CustomerRetentionProject\csv files\Subscription_SQL.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT DimCustomerSatisfaction
FROM 'C:\Users\lav chauhan\OneDrive\Desktop\Chhavi\SQL_CustomerRetentionProject\csv files\CustomerSatisfaction_SQL.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT FactRevenue
FROM 'C:\Users\lav chauhan\OneDrive\Desktop\Chhavi\SQL_CustomerRetentionProject\csv files\Revenue_SQL.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT FactRetention
FROM 'C:\Users\lav chauhan\OneDrive\Desktop\Chhavi\SQL_CustomerRetentionProject\csv files\Retention_SQL.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);