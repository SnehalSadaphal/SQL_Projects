--1]Which iPhone model had the highest sales?
--Using MAX Function
select model_name from iPhone_Models where model_id in (select model_id from Sales_data order by units_sold desc limit 1);

--Using Group by, Order by
select im.model_name, sum(sd.units_sold * sd.price) as 'Total_sales' from iPhone_Models im join Sales_data sd on im.model_id=sd.model_id group by im.model_name order by Total_sales desc limit 1;

--Using a Subquery
select model_name from (select im.model_name, sum(sd.units_sold * sd.price) as Total_sales from Sales_data sd join iPhone_Models im on sd.model_id=im.model_id group by im.model_name) Subquery order by Total_sales desc limit 1;

--Using a CTE
with highest_sale as(
select im.model_name, sum(sd.units_sold * sd.price) as Total_sales from Sales_data sd join iPhone_Models im on sd.model_id=im.model_id group by im.model_name
)
select model_name from highest_sale order by Total_sales desc limit 1;

--2]What was the average price of iPhones over time?
--Using AVG Function
 select avg(price) from sales_data;

--Using STRFTIME() Function (for SQLite):
select strftime('%Y', sale_date) As Year, Avg(price) from Sales_data group by strftime('%Y',sale_date) order by Year;

--Using a CTE
with Average_Price as (
    select strftime('%Y', sale_date) As Year, Avg(price) as Avg_Price from Sales_data
)
select Year, Avg_Price from Average_Price group by Year order by Year;

--3]How did sales vary by region?
select sd.region, sum(sd.units_sold * sd.price) as Total_sales from Sales_data sd group by sd.region;

--4]How have iPhone features changed over the years?
SELECT Release_Date, AVG(Battery_Life), AVG(Screen_Size) FROM iPhone_Models GROUP BY Release_Date;

--5]Top Performing Models by Region
SELECT sd.region, im.model_name, SUM(sd.units_sold * sd.price) AS Total_Sales
FROM iPhone_Models im, Sales_data sd
GROUP BY sd.region, im.model_name
ORDER BY sd.region, Total_Sales DESC;

--6] Query to find the correlation between price and sales
SELECT 
    sd.Price, 
    SUM(sd.units_sold * sd.price) AS Total_Sales
FROM 
   Sales_data sd
GROUP BY 
    sd.Price
ORDER BY 
    sd.Price;

--7] Query to show the popularity of different iPhone features
SELECT 
    f.feature_name , 
    COUNT(DISTINCT im.model_name ) AS Model_Count
FROM 
    iPhone_Models im, features f
GROUP BY 
    f.feature_name
ORDER BY 
    Model_Count DESC;

    