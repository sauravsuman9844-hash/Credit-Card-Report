
-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


-- 2. Create cc_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

select * from cc_detail;

select * from cust_detail;

--Q1. What is the total revenue generated from all credit card transactions?

SELECT 
    SUM(Total_Trans_Amt) AS Total_Revenue
FROM cc_detail;

--Q2. How do you calculate the total interest earned by the bank?

SELECT SUM(Interest_Earned) AS Total_Interest
FROM cc_detail;

--Q3. How do you calculate the average credit utilization ratio?

SELECT 
    AVG(Avg_Utilization_Ratio) AS Avg_Utilization_Ratio
FROM cc_detail;


--Q4. How do you analyze revenue by card category?

SELECT 
    Card_Category,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail
GROUP BY Card_Category
ORDER BY Revenue DESC;

--Q5. How do you calculate quarterly revenue and total transaction count?

SELECT 
    Qtr,
    SUM(Total_Trans_Amt) AS Revenue,
    SUM(Total_Trans_Ct) AS Total_Transactions
FROM cc_detail
GROUP BY Qtr
ORDER BY Qtr;

--Q6. How do you perform gender-wise revenue analysis?

SELECT 
    c.Gender,
    SUM(d.Total_Trans_Amt) AS Revenue
FROM cc_detail d
JOIN cust_detail c
ON d.Client_Num = c.Client_Num
GROUP BY c.Gender;

--Q7. How do you calculate revenue by education level?

SELECT 
    Education_Level,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail d
JOIN cust_detail c
ON d.Client_Num = c.Client_Num
GROUP BY Education_Level
ORDER BY Revenue DESC;

--Q8. How do you analyze state-wise revenue?

SELECT 
    State_cd,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail d
JOIN cust_detail c
ON d.Client_Num = c.Client_Num
GROUP BY State_cd
ORDER BY Revenue DESC;

--Q9. How do you compare revenue by transaction method (Chip, Swipe, Online)?

SELECT 
    Use_Chip,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail
GROUP BY Use_Chip;

--Q10. How do you identify the top 5 customer job categories by revenue?

SELECT 
    Customer_Job,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail d
JOIN cust_detail c
ON d.Client_Num = c.Client_Num
GROUP BY Customer_Job
ORDER BY Revenue DESC
LIMIT 5;

--Q11. How do you analyze revenue from delinquent vs non-delinquent accounts?

SELECT 
    Delinquent_Acc,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail
GROUP BY Delinquent_Acc;

--Q12. How do you analyze customer satisfaction score against revenue?

SELECT 
    Cust_Satisfaction_Score,
    SUM(Total_Trans_Amt) AS Revenue
FROM cc_detail d
JOIN cust_detail c
ON d.Client_Num = c.Client_Num
GROUP BY Cust_Satisfaction_Score
ORDER BY Cust_Satisfaction_Score;





