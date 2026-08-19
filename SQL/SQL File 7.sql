WITH product_revenue AS(
SELECT category,product_name,SUM(quantity*unit_price)AS total_revenue
FROM ecommerce_sales
GROUP BY category,product_name),
ranked_products AS(
SELECT category,product_name,ROUND(total_revenue,2)AS total_revenue,
RANK() OVER(PARTITION BY category
ORDER BY total_revenue DESC
) AS revenue_rank
FROM product_revenue
)
SELECT category,product_name,total_revenue,revenue_rank
FROM ranked_products
WHERE revenue_rank<=3
ORDER BY category,revenue_rank;
SELECT category,COUNT(*) AS total_orders,
SUM(order_status='Delivered')AS delivered_orders,
SUM(order_status='Cancelled')AS cancelled_orders,
SUM(order_status='Returned')AS returned_orders,
ROUND(SUM(order_status='Delivered')*100.0/COUNT(*),2)AS delivery_rate
FROM ecommerce_sales
GROUP BY category
ORDER BY delivery_rate DESC;
SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT order_id) AS unique_order_ids,
COUNT(*)-COUNT(DISTINCT order_id)
AS duplicate_order_rows
FROM ecommerce_sales;
SELECT
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(first_name IS NULL) AS missing_first_name,
    SUM(last_name IS NULL) AS missing_last_name,
    SUM(gender IS NULL) AS missing_gender,
    SUM(age_group IS NULL) AS missing_age_group,
    SUM(signup_date IS NULL) AS missing_signup_date,
    SUM(country IS NULL) AS missing_country,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(product_name IS NULL) AS missing_product_name,
    SUM(category IS NULL) AS missing_category,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(order_status IS NULL) AS missing_order_status,
    SUM(payment_method IS NULL) AS missing_payment_method,
    SUM(rating IS NULL) AS missing_rating,
    SUM(review_text IS NULL) AS missing_review_text,
    SUM(review_id IS NULL) AS missing_review_id,
    SUM(review_date IS NULL) AS missing_review_date
FROM ecommerce_sales;
SELECT
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    MIN(unit_price) AS min_unit_price,
    MAX(unit_price) AS max_unit_price,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM ecommerce_sales;
SELECT DISTINCT order_status
FROM ecommerce_sales;
SELECT DISTINCT payment_method
FROM ecommerce_sales;
SELECT DISTINCT category
FROM ecommerce_sales;