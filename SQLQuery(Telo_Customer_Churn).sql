-- Create Table
CREATE TABLE telo_data (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    InternetService VARCHAR(50),
    Contract VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(10)
);
use [Telo-Customer-Churn];

-- Total Customers
SELECT COUNT(*) AS total_customers FROM [Telco-Customer-Churn];

-- Churn Rate
SELECT 
    CASE 
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 0
    END AS churn_flag
FROM [Telco-Customer-Churn];

-- Churn by Contract Type
SELECT Contract, 
       COUNT(*) AS total,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned
FROM [Telco-Customer-Churn]
GROUP BY Contract;

-- Monthly Churn Trend (based on tenure buckets)
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM [Telco-Customer-Churn];

-- High Value Customers Leaving
SELECT *
FROM [Telco-Customer-Churn]
WHERE MonthlyCharges > 80 AND Churn = 'Yes';



