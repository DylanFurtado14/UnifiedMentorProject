use pizza;
select *
from pizza_data
limit 10;

# Total Revenue
SELECT SUM(total_price) AS total_revenue FROM pizza_data;

# Average Order Value:
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value FROM pizza_data;SELECT CEIL(SUM(total_price) / COUNT(DISTINCT order_id) * 100) / 100 AS avg_order_value
FROM pizza_data;

# Total Pizza Sold:
SELECT SUM(quantity) AS total_pizza_sold FROM pizza_data;

# Total Orders:
SELECT COUNT(DISTINCT order_id) AS total_order FROM pizza_data;

# Average Pizzas Per Order:
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_pizza_per_order FROM pizza_data;

# Hourly Trend for Total Pizzas Sold
SELECT 
    HOUR(order_time) AS order_hours, 
    SUM(quantity) AS total_pizzas_sold
FROM 
    pizza_data
GROUP BY 
    HOUR(order_time)
ORDER BY 
    total_pizzas_sold DESC;

# % of Sales by Pizza Size
SELECT pizza_size,
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_data), 2) AS PCT
FROM pizza_data
GROUP BY pizza_size
ORDER BY pizza_size;

# Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_data
-- WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

# Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM  pizza_data
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;

# Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;

# Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
 LIMIT 5;
 
 # Top 5 Pizzas by Total Orders
 SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

# Bottom 5 Pizzas by Total Orders
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;

