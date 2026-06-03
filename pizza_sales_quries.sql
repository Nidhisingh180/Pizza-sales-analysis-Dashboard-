A.KPI’S
1.Total_Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_sales

2.Average order value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) from pizza_sales

3.Total pizza’s sold
SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

4.Total orders placed
SELECT COUNT (DISTINCT order_id) AS Total_orders from pizza_sales

5. Average pizzas per order
SELECT CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) from pizza_sales


6.Daily trends for total orders

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATENAME(DW,Order_date)

7.hourly trends for total orders

SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR,order_time)

8. percentage of sales by pizza category

SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price)*100/(SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date)=1)AS PCT
from pizza_sales 
WHERE MONTH(order_date)=1
GROUP BY pizza_category


9.percentage of sales by pizza size
SELECT pizza_size, sum(total_price) as Total_Sales, sum(total_price)*100/(SELECT sum(total_price) from pizza_sales) AS PCT
from pizza_sales
GROUP BY pizza_size


10.total pizza sold by pizza category


SELECT pizza_category, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
Group by pizza_category

11.top 5 best sellers

SELECT TOP 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
Group by pizza_name
ORDER BY sum(quantity) DESC

12.bottom 5 worst sellers

SELECT TOP 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
Group by pizza_name
ORDER BY sum(quantity) ASC

