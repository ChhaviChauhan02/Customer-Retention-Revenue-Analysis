USE CustomerRetentionAnalysis;


DROP TABLE IF EXISTS FactRetention;
DROP TABLE IF EXISTS FactRevenue;
DROP TABLE IF EXISTS DimCustomerSatisfaction;
DROP TABLE IF EXISTS DimSubscription;
DROP TABLE IF EXISTS DimCustomer;


CREATE TABLE DimCustomer
(
    CustomerID VARCHAR(20),
    Gender VARCHAR(10),
    Age INT,
    SeniorCitizen VARCHAR(10),
    Married VARCHAR(10),
    Dependents VARCHAR(10),
    State VARCHAR(50),
    City VARCHAR(50),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Population INT
);

CREATE TABLE DimSubscription
(
    CustomerID VARCHAR(20),
    Contract VARCHAR(50),
    InternetService VARCHAR(50),
    InternetType VARCHAR(50),
    PaymentMethod VARCHAR(50),
    PhoneService VARCHAR(20),
    MultipleLines VARCHAR(20),
    MonthlyCharges DECIMAL(10,2)
);

CREATE TABLE FactRevenue
(
    CustomerID VARCHAR(20),
    MonthlyCharge DECIMAL(10,2),
    TotalCharges DECIMAL(12,2),
    TotalRefunds DECIMAL(12,2),
    TotalRevenue DECIMAL(12,2),
    TotalExtraDataCharges DECIMAL(12,2),
    TotalLongDistanceCharges DECIMAL(12,2)
);

CREATE TABLE FactRetention
(
    CustomerID VARCHAR(20),
    CustomerStatus VARCHAR(20),
    ChurnLabel VARCHAR(10),
    ChurnScore INT,
    ChurnCategory VARCHAR(50),
    ChurnReason VARCHAR(100),
    CLTV INT,
    CustomerSegment VARCHAR(50),
    ChurnRisk VARCHAR(20)
);


CREATE TABLE DimCustomerSatisfaction
(
    CustomerID VARCHAR(20),
    SatisfactionScore INT,
    SatisfactionLabel VARCHAR(50)
);

SELECT name
FROM sys.tables;
