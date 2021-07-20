-- creating the database

CREATE DATABASE CardioGoodFitness;

-- Making CardioGoodFitness database as default

USE CardioGoodFitness;

/* Analysis of data */

/* count of sales of each product line */

SELECT 
    Product, COUNT(Product) AS count_of_sales
FROM
    cardiogoodfitness
GROUP BY Product;



/* Age */

-- Age group of customers

SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 35 THEN '18 yrs - 35 yrs'
        ELSE 'more than 35 yrs'
    END AS customer_age_group,
    COUNT(Age) AS number_of_customers
FROM
    cardiogoodfitness
    GROUP BY customer_age_group ;
    
-- product preference by average age of customers

SELECT 
    Product, FLOOR(AVG(Age)) AS average_age
FROM
    cardiogoodfitness
GROUP BY Product
ORDER BY 1;



/* Gender */

-- distribution of partnered and single customers
SELECT 
    MaritalStatus AS Marital_status,
    COUNT(MaritalStatus) AS Number_of_customers
FROM
    cardiogoodfitness
    GROUP BY MaritalStatus;
    
    -- distribution  of male and female customers

SELECT 
    Gender, COUNT(Gender) AS no_of_customers
FROM
    cardiogoodfitness
GROUP BY Gender;

-- Product preference by gender and marital status

SELECT 
    Product,
    Gender,
    MaritalStatus,
    COUNT(Product) AS no_of_sales
FROM
    cardiogoodfitness
GROUP BY Product , gender , MaritalStatus
ORDER BY 1 , 2;



/* annual household income */

-- distribution of customers in different income groups

SELECT 
    CASE
        WHEN Income BETWEEN 20000 AND 70000 THEN '20 K - 70 K'
        ELSE 'More than 70 k'
    END AS Annual_household_income,
    COUNT(Income) AS number_of_customers
FROM
    cardiogoodfitness
GROUP BY Annual_household_income;

-- mean annual household income of partnered and single customers

SELECT 
    MaritalStatus AS Marital_status,
    FLOOR(AVG(Income)) AS Mean_annual_household_income
FROM
    cardiogoodfitness
GROUP BY Marital_status;

-- product preference by annual household income

SELECT 
    Product,
    FLOOR(AVG(Income)) AS Avg_annual_household_income
FROM
    cardiogoodfitness
GROUP BY Product
ORDER BY 1;

-- averge annual household income of male and female customers

SELECT 
    Gender,
    FLOOR(AVG(Income)) AS Avg_annual_household_income
FROM
    cardiogoodfitness
GROUP BY Gender
ORDER BY 1; 



/* self rated fitness */
    
-- self rated fitness of the customers by gender

SELECT 
    Gender, Fitness, COUNT(Fitness) AS number_of_customers
FROM
    cardiogoodfitness
GROUP BY Gender , Fitness
ORDER BY 1 DESC , 2 DESC;

-- product preference by self-rated fitness

SELECT Product, FLOOR(AVG(Fitness)) as average_self_rated_fitness
FROM cardiogoodfitness
GROUP BY Product
ORDER BY 1;



/* expected average weekly usage and mileage */

-- expected average weekly usage and mileage by self-rated fitness

SELECT 
    Fitness, FLOOR(AVG(Usage_stats)) AS Average_weekly_usage, ROUND(AVG(Miles), 1) AS Average_weekly_mileage
FROM
    cardiogoodfitness
GROUP BY Fitness
ORDER BY Fitness DESC;

-- expected average weekly usage and mileage by product-line
    
  SELECT 
    Product, FLOOR(AVG(Usage_stats)) AS Average_weekly_usage, ROUND(AVG(Miles), 1) AS Average_weekly_mileage
FROM
    cardiogoodfitness
GROUP BY Product;
