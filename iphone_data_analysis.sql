--1]Which iPhone model had the highest sales?
--Using MAX Function
select model_name from iPhone_Models where model_id in (select model_id from Sales_data order by units_sold desc limit 1);
--iPhone 13 Pro

--Using Group by, Order by
select im.model_name, sum(sd.units_sold * sd.price) as 'Total_sales' from iPhone_Models im join Sales_data sd on im.model_id=sd.model_id group by im.model_name order by Total_sales desc limit 1;
--iPhone 13 Pro|1319988.0

--Using a Subquery
select model_name from (select im.model_name, sum(sd.units_sold * sd.price) as Total_sales from Sales_data sd join iPhone_Models im on sd.model_id=im.model_id group by im.model_name) Subquery order by Total_sales desc limit 1;
--iPhone 13 Pro

--Using a CTE
with highest_sale as(
select im.model_name, sum(sd.units_sold * sd.price) as Total_sales from Sales_data sd join iPhone_Models im on sd.model_id=im.model_id group by im.model_name
)
select model_name from highest_sale order by Total_sales desc limit 1;
--iPhone 13 Pro

--2]What was the average price of iPhones over time?
--Using AVG Function
 select avg(price) from sales_data;
1049.99

--Using STRFTIME() Function (for SQLite):
select strftime('%Y', sale_date) As Year, Avg(price) from Sales_data group by strftime('%Y',sale_date) order by Year;
--2023|1049.99

--Using a CTE
with Average_Price as (
    select strftime('%Y', sale_date) As Year, Avg(price) as Avg_Price from Sales_data
)
select Year, Avg_Price from Average_Price group by Year order by Year;
--2023|1049.99

--3]How did sales vary by region?
select sd.region, sum(sd.units_sold * sd.price) as Total_sales from Sales_data sd group by sd.region;
--Asia|1074989.5
--Europe|1919983.5
--North America|3769964.5

--4]How have iPhone features changed over the years?
SELECT Release_Date, AVG(Battery_Life), AVG(Screen_Size) FROM iPhone_Models GROUP BY Release_Date;
--2017-09-22|2256.0|5.1
--2017-11-03|2716.0|5.8
--2019-09-20|3078.0|5.95
--2020-10-23|2815.0|6.1
--2020-11-13|2227.0|5.4
--2021-09-24|3167.5|6.1

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

    