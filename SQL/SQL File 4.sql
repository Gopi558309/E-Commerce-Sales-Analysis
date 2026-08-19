SELECT order_status,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY order_status
ORDER BY Total_Orders DESC;
SELECT category,order_status,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY category,order_status
ORDER BY category,Total_Orders DESC;
SELECT category,COUNT(*) AS Total_Orders,SUM(order_status="Cancelled") AS Cancelled_Orders,
ROUND(SUM(order_status="Cancelled")*100.0/COUNT(*),2) AS Cancellation_Rate
FROM ecommerce_sales
GROUP BY category
ORDER BY Cancellation_Rate DESC;
SELECT payment_method,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY Total_Orders DESC;
SELECT country,payment_method,COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY country,payment_method
ORDER BY country,Total_Orders DESC;
SELECT category,ROUND(AVG(rating),2) AS Average_Rating,COUNT(*) AS Total_Reviews
FROM ecommerce_sales
GROUP BY category
ORDER BY Average_Rating DESC;
SELECT DATE_FORMAT(order_date,'%Y-%m') AS order_month,
COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
ORDER BY order_month ASC;
SELECT DATE_FORMAT(order_date,'%Y-%m') AS order_month,
ROUND(SUM(quantity*unit_price),2) AS monthly_revenue
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
ORDER BY order_month ASC;