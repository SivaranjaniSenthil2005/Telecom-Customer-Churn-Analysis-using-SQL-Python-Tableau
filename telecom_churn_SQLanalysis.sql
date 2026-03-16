-- TELECOM CUSTOMER CHURN SQL ANALYSIS

-- 1. View first 10 rows
SELECT *
FROM telco_customer_churn
LIMIT 10;

-- 2. Total number of customers
SELECT COUNT(*) AS total_customers
FROM telco_customer_churn;

-- 3. Churn distribution
SELECT `Churn Label`, COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY `Churn Label`;

-- 4. Churn percentage
SELECT 
`Churn Label`,
COUNT(*) AS customers,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telco_customer_churn),2) AS churn_percentage
FROM telco_customer_churn
GROUP BY `Churn Label`;

-- 5. Churn by Contract
SELECT Contract, `Churn Label`, COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY Contract, `Churn Label`
ORDER BY Contract;

-- 6. Churn by Internet Service
SELECT `Internet Service`, `Churn Label`, COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY `Internet Service`, `Churn Label`;

-- 7. Average Monthly Charges by Churn
SELECT `Churn Label`,
AVG(`Monthly Charges`) AS avg_monthly_charge
FROM telco_customer_churn
GROUP BY `Churn Label`;

-- 8. Churn by Payment Method
SELECT `Payment Method`, `Churn Label`, COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY `Payment Method`, `Churn Label`;

-- 9. Churn Value Distribution
SELECT `Churn Value`, COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY `Churn Value`;

-- 10. Average Churn Score by Churn Label
SELECT `Churn Label`,
AVG(`Churn Score`) AS avg_churn_score
FROM telco_customer_churn
GROUP BY `Churn Label`;

-- 11. Churn Reason Analysis
SELECT `Churn Reason`, COUNT(*) AS total_customers
FROM telco_customer_churn
WHERE `Churn Label` = 'Yes'
GROUP BY `Churn Reason`
ORDER BY total_customers DESC;

-- 12. High Risk Customers (High Charges + Churn Yes)
SELECT `CustomerID`, `Monthly Charges`, Contract, `Churn Label`
FROM telco_customer_churn
WHERE `Churn Label` = 'Yes'
ORDER BY `Monthly Charges` DESC;