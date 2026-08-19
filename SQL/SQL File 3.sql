SELECT COUNT(*) AS total_rows
FROM ecommerce_sales;
SELECT * 
FROM ecommerce_sales
LIMIT 10;
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_sales;
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM ecommerce_sales;
SELECT COUNT(DISTINCT country) AS unique_countries
FROM ecommerce_sales;
SELECT country,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY country
ORDER BY Total_Orders DESC;
SELECT category,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY category
ORDER BY Total_Orders DESC;
SELECT category,ROUND(SUM(quantity * unit_price),2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY category
ORDER BY Total_Revenue DESC;
SELECT category,ROUND(AVG(unit_price), 2) AS Average_Unit_Price
FROM ecommerce_sales
GROUP BY category
ORDER BY Average_Unit_Price DESC;
SELECT product_name,category,SUM(quantity) AS total_units_sold,
ROUND(SUM(quantity*unit_price),2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY product_name,category
ORDER BY Total_Revenue DESC
LIMIT 10;