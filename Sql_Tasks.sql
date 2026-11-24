create database car_sales;

use car_sales;

CREATE TABLE car_sales_data (
    Sale_ID VARCHAR(50),
    Sale_Date DATE,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Selling_Price INT,
    Fuel_Type VARCHAR(30),
    Transmission VARCHAR(30),
    Mileage FLOAT,
    Mileage_Unit VARCHAR(20),
    Region VARCHAR(30),
    Color VARCHAR(30)
);

SELECT COUNT(*) AS total_cars
FROM car_sales_data;

select Brand, count(*) as total_sales
from car_sales_data
group by Brand
order by total_sales desc;

-- Brand-wise total sales
 
SELECT Brand, COUNT(*) AS total_sales
FROM car_sales_data
GROUP BY Brand
ORDER BY total_sales DESC;

-- Average selling price 

SELECT ROUND(AVG(Selling_Price), 2) AS average_price
FROM car_sales_data;

-- Fuel type distribution 

SELECT Fuel_Type, COUNT(*) AS total_cars
FROM car_sales_data
GROUP BY Fuel_Type
ORDER BY total_cars DESC;

-- Transmission distribution

SELECT Transmission, COUNT(*) AS total_cars
FROM car_sales_data
GROUP BY Transmission
ORDER BY total_cars DESC;


-- Top 5 selling car models 

SELECT Model, COUNT(*) AS total_sales
FROM car_sales_data
GROUP BY Model
ORDER BY total_sales DESC
LIMIT 5;

-- Region-wise car sales

SELECT Region, COUNT(*) AS total_sales
FROM car_sales_data
GROUP BY Region
ORDER BY total_sales DESC; 

-- brand wise total revenue

SELECT Brand,SUM(Selling_Price) AS total_revenue
FROM car_sales_data
GROUP BY Brand
ORDER BY total_revenue DESC; 

-- Top 5 most expensive cars

SELECT Brand, Model, Selling_Price
FROM car_sales_data
ORDER BY Selling_Price DESC
LIMIT 5;

-- Average selling price by brand

SELECT Brand,ROUND(AVG(Selling_Price), 2) AS average_price
FROM car_sales_data
GROUP BY Brand
ORDER BY average_price DESC;

-- Average mileage by brand

SELECT Brand,ROUND(AVG(Mileage), 2) AS average_mileage
FROM car_sales_data
GROUP BY Brand
ORDER BY average_mileage DESC;

-- Cars priced above the overall average price

SELECT Brand, Model, Selling_Price
FROM car_sales_data
WHERE Selling_Price > (
    SELECT AVG(Selling_Price)
    FROM car_sales_data
)
ORDER BY Selling_Price DESC
LIMIT 10;

-- Count premium cars by brand 

SELECT Brand, COUNT(*) AS premium_cars
FROM car_sales_data
WHERE Selling_Price > (
    SELECT AVG(Selling_Price)
    FROM car_sales_data
)
GROUP BY Brand
ORDER BY premium_cars DESC;

-- Rank brands by revenue

SELECT 
    Brand,
    SUM(Selling_Price) AS total_revenue,
    RANK() OVER (ORDER BY SUM(Selling_Price) DESC) AS revenue_rank
FROM car_sales_data
GROUP BY Brand;


-- Identify premium-priced vehicles. 

SELECT Brand, Model, Selling_Price
FROM car_sales_data
WHERE Selling_Price > (
    SELECT AVG(Selling_Price)
    FROM car_sales_data
)
ORDER BY Selling_Price DESC;



-- final count of premium cars

SELECT COUNT(*) AS premium_cars
FROM car_sales_data
WHERE Selling_Price > (
    SELECT AVG(Selling_Price)
    FROM car_sales_data
);
 