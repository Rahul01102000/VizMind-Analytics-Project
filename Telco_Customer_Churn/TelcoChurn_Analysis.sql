create database analysis
use analysis

CREATE TABLE TelcoCustomers (
    customerID VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen BIT,
    Partner VARCHAR(3),
    Dependents VARCHAR(3),
    tenure INT,
    PhoneService VARCHAR(3),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(3),
    PaymentMethod VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(3)
);
select * from TelcoCustomers


--1 Overall Churn Rate
SELECT 
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'chu' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'chu' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRatePercent
FROM TelcoCustomers;


--2 Churn Rate by Contract Type
SELECT 
    Contract,
    COUNT(*) AS Total,
    SUM(CASE WHEN Churn = 'chu' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'chu' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRatePercent
FROM TelcoCustomers
GROUP BY Contract;

--3 Monthly Charges vs. Churn Insight

SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS AvgMonthlyCharges,
    ROUND(AVG(TotalCharges), 2) AS AvgTotalCharges,
    ROUND(AVG(tenure), 1) AS AvgTenure
FROM TelcoCustomers
GROUP BY Churn;

--4 Top 5 Services with Highest Churn

SELECT 
    InternetService,
    COUNT(*) AS Total,
    SUM(CASE WHEN Churn = 'chu' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'chu' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ChurnRatePercent
FROM TelcoCustomers
GROUP BY InternetService
ORDER BY ChurnRatePercent DESC;

--5 Tenure Group Churn Analysis

WITH TenureChurn AS (
    SELECT 
        CASE 
            WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
            WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
            WHEN tenure BETWEEN 25 AND 48 THEN '25-48 months'
            ELSE '48+ months'
        END AS TenureGroup,
        COUNT(*) AS TotalCustomers,
        SUM(CASE WHEN Churn = 'Chu' THEN 1 ELSE 0 END) AS ChurnedCustomers,
        ROUND(
            100.0 * SUM(CASE WHEN Churn = 'Chu' THEN 1 ELSE 0 END) / COUNT(*), 
            2
        ) AS ChurnRatePercent
    FROM TelcoCustomers
    GROUP BY 
        CASE 
            WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
            WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
            WHEN tenure BETWEEN 25 AND 48 THEN '25-48 months'
            ELSE '48+ months'
        END
)

SELECT *
FROM TenureChurn
ORDER BY 
    CASE TenureGroup
        WHEN '0-12 months' THEN 1
        WHEN '13-24 months' THEN 2
        WHEN '25-48 months' THEN 3
        WHEN '48+ months' THEN 4
    END;





