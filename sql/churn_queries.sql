CREATE TABLE churn_data (
    CustomerID VARCHAR(50),
    Gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    TenureMonths INT,
    PhoneService VARCHAR(10),
    InternetService VARCHAR(50),
    Contract VARCHAR(50),
    PaymentMethod VARCHAR(100),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    ChurnValue INT
);
-- Data imported from Excel/CSV using bulk insert or import wizard
SELECT COUNT(*) AS total_customers
FROM churn_data;

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(ChurnValue) AS churned_customers,
    (SUM(ChurnValue) * 100.0 / COUNT(*)) AS churn_rate
FROM churn_data
GROUP BY Contract;

SELECT *
FROM churn_data
WHERE MonthlyCharges > 80
AND ChurnValue = 1;


SELECT 
    PaymentMethod,
    (SUM(ChurnValue) * 100.0 / COUNT(*)) AS churn_rate
FROM churn_data
GROUP BY PaymentMethod;

SELECT 
    ChurnValue,
    AVG(MonthlyCharges) AS avg_charges
FROM churn_data
GROUP BY ChurnValue;