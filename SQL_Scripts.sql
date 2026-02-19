use ecommerce_db;
SELECT 
    COUNT(*) AS Total_Customers,
    AVG(Lifetime_Value) AS Avg_LTV,
    (SUM(Churned) / COUNT(*)) * 100 AS Churn_Rate_Percentage,
    AVG(Customer_Service_Calls) AS Avg_Service_Calls
FROM customer_churn;

SELECT 
    Gender,
    COUNT(*) AS Total,
    SUM(Churned) AS Churned,
    ROUND(SUM(Churned)/COUNT(*)*100,2) AS Churn_Rate
FROM customer_churn
GROUP BY Gender;

SELECT Country, Gender, COUNT(*) as Total, SUM(Churned) as Churned_Count,
(SUM(Churned)/COUNT(*))*100 as Churn_Rate
FROM customer_churn
GROUP BY Country, Gender
ORDER BY Churn_Rate DESC;


SELECT Age, Country, Customer_Service_Calls, Cart_Abandonment_Rate
FROM customer_churn
WHERE Churned = 0 AND Customer_Service_Calls > 5 AND Cart_Abandonment_Rate > 60
ORDER BY Customer_Service_Calls DESC;

