SELECT COUNT(*) AS Total_Orders,
COUNT(DISTINCT customer_id) AS Unique_Customers,
ROUND(SUM(quantity*unit_price),2) AS Total_Revenue,
ROUND(AVG(quantity*unit_price),2) AS Average_Order_Value
FROM ecommerce_sales 
SELECT customer_id,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY Total_Orders DESC
LIMIT 10;
SELECT customer_id,COUNT(*) AS Total_Orders,
ROUND(SUM(quantity*unit_price),2) AS Total_Revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY Total_Revenue DESC
LIMIT 10;
SELECT customer_id,COUNT(*) AS Total_Orders,
ROUND(SUM(quantity*unit_price),2) AS Total_Revenue,
ROUND(SUM(quantity*unit_price)/COUNT(*),2) AS Average_Order_Value
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY Average_Order_Value DESC
LIMIT 10;
SELECT CASE WHEN total_orders = 1 THEN 'One-time'
WHEN total_orders BETWEEN 2 and 3 THEN 'Repeat'
ELSE 'FREQUENT'
END AS customer_segment,
COUNT(*) AS number_of_customers
FROM(SELECT customer_id,COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id) AS customer_orders
GROUP BY customer_segment
ORDER BY number_of_customers DESC;
SELECT CASE WHEN total_orders = 1 THEN 'One-time'
WHEN total_orders BETWEEN 2 and 3 THEN 'Repeat'
ELSE 'Frequent'
END AS customer_segment,
COUNT(*) AS number_of_customers,
ROUND(SUM(total_revenue),2) AS total_revenue,
ROUND(AVG(total_revenue),2) AS avg_customer_revenue
FROM(SELECT customer_id,COUNT(*) AS total_orders,
SUM(quantity*unit_price) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id) AS customer_data
GROUP BY customer_segment
ORDER BY total_revenue DESC;